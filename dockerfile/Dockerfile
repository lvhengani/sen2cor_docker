# This docker is based on ubuntu 14.04
# The objective is to run sen2cor in this docker
FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

ARG SEN2COR_VERSION='2.4.0'
ARG GOSU_VERSION='1.9'
ARG SEN2COR="Sen2Cor-${SEN2COR_VERSION}-Linux64.run"
RUN sed 's/main$/main universe multiverse/' -i /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
        build-essential \
        python \
        python-dev \
        python-distribute \
        python-pip \
        software-properties-common && \   
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
        gdal-bin \
        libgdal-dev \
        python-gdal \
        python-pyproj \
        libxt6 \
        libxpm4 \
        libxmu6 \
        wget \
        curl \
        unzip && \
    pip install psycopg2 &&\
    wget "http://step.esa.int/thirdparties/sen2cor/${SEN2COR_VERSION}/${SEN2COR}" && \
    bash ${SEN2COR} && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh