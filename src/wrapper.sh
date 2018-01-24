#!/bin/bash

#default values
resolution=10
with_dem=/root/sen2cor/cfg/L2A_GIPP_without_dem.xml
delete_unzipped=n

function usage()
{
    printf "Wrapper script for Sen2Cor\n"
    printf "Usage: ./run [-h] [-r {10,20,60}] [-d] [-u] SCENE-ID\n"
    printf "\n"
    printf "  -h --help\t\tPrints this help and exits\n"
    printf "  -r --resolution\tTarget resolution, can be 10, 20 or 60m (default $resolution)\n"
    printf "  -d --with-dem\t\tUses a DEM (default off)\n"
    printf "  -u --delete-unzipped\tDelete the unzipped file after running Sen2Cor (default off)\n"
    printf "  SCENE-ID\t\tThe Sentinel-2 scene id to process\n"
}

getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    printf "I’m sorry, `getopt --test` failed in this environment.\n"
    exit 1
fi

OPTIONS=hr:du
LONGOPTIONS=help,resolution:,with-dem,delete-unzipped

# -temporarily store output to be able to check for errors
# -e.g. use “--options” parameter by name to activate quoting/enhanced mode
# -pass arguments only via   -- "$@"   to separate them correctly
PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTIONS --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # e.g. $? == 1
    #  then getopt has complained about wrong arguments to stdout
    usage
    exit 2
fi
# read getopt’s output this way to handle the quoting right:
eval set -- "$PARSED"

# options are split until we see --
while true; do
    case "$1" in
        -h|--help)
            usage
            exit
            ;;
        -r|--resolution)
            resolution="$2"
            shift 2
            ;;
        -d|--with-dem)
            with_dem=/root/sen2cor/cfg/L2A_GIPP_with_dem.xml
            shift
            ;;
        -u|--delete-unzipped)
            delete_unzipped=y
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            printf "Programming error\n"
            exit 3
            ;;
    esac
done

# handle non-option arguments
if [[ $# -ne 1 ]]; then
    usage
    printf "A single scene id is required.\n"
    exit 4
fi

# Get input variables
zipped_dir=/var/sentinel2_data/archives/"$1"
unzipped_dir=/var/sentinel2_data/unzipped_scenes/"${1%.zip}.SAFE"

# unzip the file
## Delete the previously unzipped file, it maybe corrupt or something went wrong.
if [ -e $unzipped_dir ]; then
   rm -r $unzipped_dir
fi
unzip -q $zipped_dir -d /var/sentinel2_data/unzipped_scenes

# Run sen2cor
/Sen2Cor-2.4.0-Linux64/bin/L2A_Process $unzipped_dir --resolution=$resolution --GIP_L2A $with_dem

# Delete the unzipped file after running sen2cor
if [ "$delete_unzipped" == "y" ]; then
   rm -r $unzipped_dir
fi
