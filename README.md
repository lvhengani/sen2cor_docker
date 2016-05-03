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
source /root/sen2cor/L2A_Bashrc~
~~~~


