# Docker for SEN2COR #


This is a docker for sen2cor, a prototype processor for processing Sentinel 2 Level 1C to Level 2A. 
The orginal sen2cor installer can be downloaded from [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/).

When using this docker there is no need to download the original installer, simply follow the instructions on how to use below.

## Using the docker ##

First clone the repository into your local machine, assuming you have git installed into your machine.

~~~
git clone https://github.com/lvhengani/sen2cor_docker
~~~

To use the container as it is, create directories `~/Documents/Sentinel/2/archives`, `~/Documents/Sentinel/2/unzipped_scenes` and `~/Documents/Sentinel/2/dem`. These paths are set in the `.env` file. 

~~~
archives=~/Documents/Sentinel/2/archives
unzipped_scenes=~/Documents/Sentinel/2/unzipped_scenes
dem=~/Documents/Sentinel/2/dem
~~~

The first volume `~/Documents/Sentinel/2/archives` is a full path to the Sentinel data archives repository (.zip).
The second volume `~/Documents/Sentinel/2/unzipped_scenes` is a full path to a repository with unzipped scenes (.SAFE).
The third volume `~/Documents/Sentinel/2/dem` is a full path to a repository where the downloaded DEMs are stored.

If you decide to store the data elsewhere edit the paths on the provided `.env` file but make sure that the paths exists. 

To build, run the command:

~~~
./build
~~~

To test enter the command `./run` without any commandline inputs. This command prints the 
supported command line parameters:



~~~
./run
Wrapper script for Sen2Cor
Usage: ./run [-h] [-r {10,20,60}] [-d] [-u] SCENE-ID

  -h --help             Prints this help and exits
  -r --resolution       Target resolution, can be 10, 20 or 60m (default 10)
  -d --with-dem         Uses a DEM (default off)
  -u --delete-unzipped  Delete the unzipped file after running Sen2Cor (default off)
  SCENE-ID              The Sentinel-2 scene id to process
/src/wrapper.sh: A scene id is required.
~~~


To run the processor type and run the command:

~~~
./run -r 10 -d -u S2A_L1C_scene_id
~~~

## Tutorial ##

After cloning, change directory into the cloned folder.

To use the image without editing anything on the `.env` file, create directrories `~/Documents/Sentinel/2/archives`, `~/Documents/Sentinel/2/unzipped_scenes` and `~/Documents/Sentinel/2/dem`. 
Alternatively, you can edit edit the above directories/volumes in the `.env` file using the path where sentinel scenes are located in your machine as already mentioned above.

Download a Sentinel 2 tile for example "S2A_MSIL1C_20161206T080312_N0204_R035_T34HFH_20161206T081929.zip" and save it in the "~/Documents/Sentinel/2/archives" directory. 

Build the docker image by running `./build`. This can take time.

Run sen2cor to convert the downloaded from L1C to L2A  as follows:

~~~
./run -r 10 -d -u S2A_MSIL1C_20161206T080312_N0204_R035_T34HFH_20161206T081929.zip
~~~

The results will be in the `~/Documents/Sentinel/2/unzipped_scenes` folder with the name "S2A_MSIL2A_20161206T080312_N0204_R035_T34HFH_20161206T081929.SAFE".

For more information on how to use sen2cor, visit the site [ESA STEP](http://step.esa.int/main/third-party-plugins-2/sen2cor/).

# Acknowlegments

Special thanks to @hjaekel who edited the `Dockefile` and `wrapper.sh` files by adding to commandline options for using a DEM and for deleting the unzipped file.    