#!/bin/bash

source /root/sen2cor/L2A_Bashrc

#set -x

# Get input variables
zipped_dir=/var/sentinel2_data/archives/"$1"
unzipped_dir=/var/sentinel2_data/unzipped_scenes/"${1%.zip}.SAFE"

# Get the oupout resolution, if no resolution is set set the output resolution to 60
outresolution="$2"

# unzip the file 
unzip -q $zipped_dir -d /var/sentinel2_data/unzipped_scenes

# Run sen2cor
L2A_Process $unzipped_dir --resolution=$outresolution

# Delete the unzipped file after running sen2cor
#rm -r $unzipped_dir
