FROM debian:buster

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
    add-apt-repository 'deb [arch=amd64] http://ftp.osuosl.org/pub/mariadb/repo/10.4/debian buster main' && \
    apt-get update && \
    apt-get install -y mariadb-client xz-utils
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
