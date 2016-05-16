# Docker for SEN2COR #


This is a docker for sen2cor, a prototype processor for processing Sentinel 2 Level 1C to Level 2A. 
The original sen2cor can be downloaded from https://www.github.com.umwilm/SEN2COR.


## Using the docker ##
On the sen2cor.yml file change the volumes accordingly except the wraper.
The first volume is a full path to the Sentinel data repository.
The second volume is a full path to a repository with scripts (not used in this case), but should there be a need, a service can be added in the docker-compose (sen2cor.yml) file.

To build, run the command:

~~~
./build

~~~

To test type and run the command

~~~
./test

~~~

To run the processor type and run the command:

~~~
./run /path/to/L1c/Directory

~~~

To see how the docker image is build run the command:

~~~
./command

~~~

When running ./command, before starting the L2A_Process, also run:

~~~
source /root/sen2cor/L2A_Bashrc
~~~~

## Tutorial ##

First clone the repo into your local machine
~~~
git clone https://github.com/lvhengani/sen2cor_docker

~~~

In the docker-compose file, edit volumes using the path where sentinel scenes are located as in your local machine.
i.e create a directrory "~/Documents/sentinel_data". Edit the first volume to "~/Documents/sentinel_data". 

Download a Sentinel 2 tile with code S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip and save it in the "~/Documents/sentinel_data" directory. 

unzip the downloaded folder as follows:

~~~
unzip S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip 
~~~

This will result in a folder with the name S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE 

Build the docker image by running ./build.

Run sen2cor to convert the downloaded from L1C to L2A  as follows:

~~~
./run S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE

~~~ 

The results will be in a folder with the name S2A_USER_PRD_MSIL2A_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE.
 
