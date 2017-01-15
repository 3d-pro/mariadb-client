FROM 3dpro/base-debian

RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
    add-apt-repository 'deb [arch=amd64,i386] http://ftp.osuosl.org/pub/mariadb/repo/10.1/debian sid main' && \
    apt-get update && \
    apt-get install -y mariadb-client libffi-dev libssl-dev build-essential && \
    wget http://tukaani.org/xz/xz-5.2.3.tar.gz && \
    tar zxf xz-5.2.3.tar.gz && \
    cd xz-5.2.3/ && \
    ./configure --disable-shared && \
    make && \
    make install && \
    rm -rf xz-5.2.3* && \
    apt-get purge -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy
