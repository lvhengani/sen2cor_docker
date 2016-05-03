#!/bin/bash

source /root/sen2cor/L2A_Bashrc
exec L2A_Process --resolution 10 --profile /var/sentinel2_data/"$1"
