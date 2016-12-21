# Docker for SEN2COR #


This is a docker for sen2cor, a prototype processor for processing Sentinel 2 Level 1C to Level 2A. 
The original sen2cor can be downloaded from https://www.github.com/umwilm/SEN2COR.


## Using the docker ##
On the sen2cor.yml file change the volumes accordingly except the wrapper.
The first volume is a full path to the Sentinel data archives/repository (.zip).
The second volume is a full path to a repository with unzipped scenes (.SAFE).

To build, run the command:

~~~
./build

~~~

To test

~~~
./test
~~~


To run the processor type and run the command:

~~~
./run S2A_L1C_scene_id.zip 10

~~~


## Tutorial ##

First clone the repo into your local machine

~~~
git clone https://github.com/lvhengani/sen2cor_docker

~~~

In the docker-compose file, edit volumes using the path where sentinel scenes are located as in your local machine.
i.e create a directrory "~/Documents/Sentinel/2/archives" and ~/Documents/Sentinel/2/unzipped_scenes. 

Download a Sentinel 2 tile for example "S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip" and save it in the "~/Documents/Sentinel/2/archives" directory. 

Build the docker image by running `./build`.

Run sen2cor to convert the downloaded from L1C to L2A  as follows:

~~~
./run S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip 10

~~~ 

The results will be in the "~/Documents/Sentinel/2/unzipped_scenes" folder with the name S2A_USER_PRD_MSIL2A_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE.
