#!/bin/bash

set -x

if [$1 == ""]; then
   /Sen2Cor-2.4.0-Linux64/bin/L2A_Process --help
   exit 1
fi

# Get input variables
zipped_dir=/var/sentinel2_data/archives/"$1"
unzipped_dir=/var/sentinel2_data/unzipped_scenes/"${1%.zip}.SAFE"

# Get the oupout resolution, if no resolution is set set the output resolution to 10
outresolution="$2"
if [ $outresolution=='' ]; then
      outresolution=10
fi

# unzip the file 
## Delete the previously unzipped file, it maybe corrupt or something went wrong.
if [ -e $unzipped_dir ]; then
   rm -r $unzipped_dir
fi 
unzip -q $zipped_dir -d /var/sentinel2_data/unzipped_scenes

# Run sen2cor
/Sen2Cor-2.4.0-Linux64/bin/L2A_Process $unzipped_dir --resolution=$outresolution

# Delete the unzipped file after running sen2cor
#rm -r $unzipped_dir
