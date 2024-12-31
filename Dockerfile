FROM ubuntu as buildImage 

RUN set -ex;        \ 
    apt-get update; \
    apt-get install -y g++ curl cmake libzmq3-dev; \ 
    cd /usr/src; \
    curl -L https://github.com/Matroska-Org/foundation-source/archive/refs/tags/mkvalidator-0.6.0.tar.gz | tar -zxf; \
    cd mkvalidator-0.6.0; \ 
    cmake -S . -B build ; \
    cmake --build build; \


