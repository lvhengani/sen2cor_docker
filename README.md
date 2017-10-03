# Docker for SEN2COR #


This is a docker for sen2cor, a prototype processor for processing Sentinel 2 Level 1C to Level 2A. 
The orginal sen2cor installer can be downloaded from [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/).

When using this docker there is no need to download the original installer, simply follow the instructions on how to use below.

## Using the docker ##

First clone the repository into your local machine, assuming you have git installed into your machine.

~~~
git clone https://github.com/lvhengani/sen2cor_docker
~~~

To use the container as it is, create directories `~/Documents/Sentinel/2/archives` and `~/Documents/Sentinel/2/unzipped_scenes`. 
These paths are set in the `.env` file. 

~~~
archives=~/Documents/Sentinel/2/archives
unzipped_scenes=~/Documents/Sentinel/2/unzipped_scenes
~~~

The first volume `~/Documents/Sentinel/2/archives` is a full path to the Sentinel data archives repository (.zip).
The second volume `~/Documents/Sentinel/2/unzipped_scenes` is a full path to a repository with unzipped scenes (.SAFE).

If you decide to store the data elsewhere edit the paths on the provided `.env` file but make sure that the paths exists. 

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

To use the image without editing anything on the `.env` file, create directrories `~/Documents/Sentinel/2/archives` and `~/Documents/Sentinel/2/unzipped_scenes`. 
Alternatively, you can edit edit the above directories/volumes in the `.env` file using the path where sentinel scenes are located in your machine as already mentioned above.

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

The results will be in the `~/Documents/Sentinel/2/unzipped_scenes` folder with the name S2A_USER_PRD_MSIL2A_PDMC_20160504T214803_R092_V20160504T080523_20160504T080523.SAFE.

For more information on how to use sen2cor, visit the site [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/).