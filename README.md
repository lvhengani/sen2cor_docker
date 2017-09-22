# Docker for SEN2COR #


This is a docker for sen2cor, a prototype processor for processing Sentinel 2 Level 1C to Level 2A. 
The orginal sen2cor installer can be downloaded from [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/)
When using this docker there is no need to download the original installer, simply follow the instructions on how to use.

## Using the docker ##

First clone the repository into your local machine, assuming you have git isntalled into your machine.

~~~
git clone https://github.com/lvhengani/sen2cor_docker
~~~

On the docker-compose file `docker-compose.yml` file change the volumes accordingly except the wrapper.

~~~
  - ~/Documents/Sentinel/2/archives:/var/sentinel2_data/archives:rw # archived_data_in_pc:archived_data_in_docker_image
  - ~/Documents/Sentinel/2/unzipped_scenes:/var/sentinel2_data/unzipped_scenes #unzipped_data_in_pc:unzipped_data_in_docker_image
~~~

If you decide to use the container as it is, create a directory `~/Documents/Sentinel/2/archives` and `~/Documents/Sentinel/2/unzipped_scenes`. 

The first volume is a full path to the Sentinel data archives/repository (.zip).
The second volume is a full path to a repository with unzipped scenes (.SAFE).

To build, run the command:

~~~
./build
~~~

To test enter the command `./run` without any commandline inputs. 

~~~
./run
~~~


To run the processor type and run the command:

~~~
./run S2A_L1C_scene_id.zip 10

~~~

## Tutorial ##

After cloning, change directory into the cloned folder.

To use the image without editing anything on the `docker-compose.yml` file, create a directrories "~/Documents/Sentinel/2/archives" and ~/Documents/Sentinel/2/unzipped_scenes. 
Alternavley, you can edit edit the above directories/volumes in the `docker-compose.yml` file using the path where sentinel scenes are located in your machine.

Download a Sentinel 2 tile for example "S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip" and save it in the "~/Documents/Sentinel/2/archives" directory. 

Build the docker image by running `./build`. This can take time.

Run sen2cor to convert the downloaded from L1C to L2A  as follows:

~~~
./run S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip 10
~~~

or 

~~~
./run S2A_OPER_PRD_MSIL1C_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.zip 20
~~~ 

The results will be in the "~/Documents/Sentinel/2/unzipped_scenes" folder with the name S2A_USER_PRD_MSIL2A_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE.

For more information on how to use sen2cor, visit the site [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/).