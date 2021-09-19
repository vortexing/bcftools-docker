# build as fredhutch/bcftools:1.13

FROM ubuntu:18.04

RUN apt-get update -y 

RUN apt-get install -y curl autoconf automake make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libperl-dev libgsl0-dev

RUN curl -LO https://github.com/samtools/bcftools/archive/1.13.tar.gz

RUN curl -LO https://github.com/samtools/htslib/releases/download/1.13/htslib-1.13.tar.bz2

RUN tar jxf htslib-1.13.tar.bz2

RUN tar zxf 1.13.tar.gz

WORKDIR /bcftools-1.13

RUN autoheader && autoconf && ./configure && make && make install

WORKDIR /htslib-1.13

RUN autoheader && autoconf && ./configure && make && make install

WORKDIR /

RUN rm -rf 1.13.tar.gz bcftools-1.13 htslib-1.13.tar.bz2 htslib-1.13
