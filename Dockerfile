# This docker is based on ubuntu 14.04
# The objective is to run sen2cor in this docker
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

ENV SEN2COR_VERSION='2.3.0' \
    ANACONDA_VERSION='4.2.0'

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
        libxt6 \
        libxpm4 \
        libxmu6

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget &&\
    apt-get install -y unzip

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/cond.sh && \
    wget  http://repo.continuum.io/archive/Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh && \
    bash Anaconda2-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p /opt/conda

ENV PATH /opt/conda/bin:$PATH

RUN wget http://step.esa.int/thirdparties/sen2cor/${SEN2COR_VERSION}/sen2cor-${SEN2COR_VERSION}.tar.gz && \
    tar -xvzf sen2cor-${SEN2COR_VERSION}.tar.gz && \
    cd sen2cor-${SEN2COR_VERSION} && \
    /bin/echo -e "y\ny\ny\n" | python setup.py install

RUN pip install Glymur

RUN test -f /usr/lib/x86_64-linux-gnu/libcom_err.so.3 || ln -s /usr/lib/x86_64-linux-gnu/libcom_err.so /usr/lib/x86_64-linux-gnu/libcom_err.so.3
