FROM ubuntu as buildImage 

RUN set -e 
RUN apt-get update 
RUN pt-get install -y g++ curl cmake libzmq3-dev
RUN cd /usr/src 
RUN curl -L https://github.com/Matroska-Org/foundation-source/archive/refs/tags/mkvalidator-0.6.0.tar.gz | tar -zxf
RUN cd mkvalidator-0.6.0
RUN cmake -S . -B build 
RUN cmake --build build
