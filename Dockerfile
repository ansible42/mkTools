FROM ubuntu as buildImage 

RUN set -e 
RUN apt-get update 
RUN apt-get install -y g++ curl cmake libzmq3-dev
RUN cd /usr/src 
RUN curl -L https://github.com/Matroska-Org/foundation-source/archive/refs/tags/mkvalidator-0.6.0.tar.gz | tar -zxf -
WORKDIR /foundation-source-mkvalidator-0.6.0
RUN ls -a
RUN cmake -S . -B _build 
RUN cmake --build _build --config Release --parallel
RUN cmake --install _build --config Release --prefix _built
RUN find . -name *mkclean*
RUN ls -a ./_build/mkclean
RUn ./_build/mkclean/mkclean --help
#RUN mkclean
