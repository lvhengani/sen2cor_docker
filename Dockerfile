# This docker is based on ubuntu 14.04
# The objective is to run sen2cor in this docker
FROM ubuntu:14.04

RUN sed 's/main$/main universe multiverse/' -i /etc/apt/sources.list
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
        build-essential \
        python \
        python-dev \
        python-distribute \
        python-pip \
        software-properties-common 

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update && \
    apt-get install -y \
        gdal-bin \
        libgdal-dev \
        python-gdal \
        python-pyproj \
        python-numpy \
        python-psycopg2 \
        python-matplotlib \
        python-matplotlib-data \
        python-scipy \
        libxt6 \
        libxpm4 \
        libxmu6

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/cond.sh && \
    wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh && \
    bash Anaconda-2.3.0-Linux-x86_64.sh -b -p /opt/conda

ENV PATH /opt/conda/bin:$PATH

RUN wget http://s2tbx.telespazio-vega.de/sen2cor/sen2cor-2.0.6.tar.gz && \
    tar -xvzf sen2cor-2.0.6.tar.gz && \
    cd sen2cor-2.0.6 && \
    /bin/echo -e "y\ny\ny\n" | python setup.py install

#RUN pwd

RUN pip install Glymur

RUN test -f /usr/lib/x86_64-linux-gnu/libcom_err.so.3 || ln -s /usr/lib/x86_64-linux-gnu/libcom_err.so /usr/lib/x86_64-linux-gnu/libcom_err.so.3
