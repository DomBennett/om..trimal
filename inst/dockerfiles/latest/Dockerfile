# Example host distro
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    make gcc git g++

RUN git clone --depth=5 https://github.com/scapella/trimal

RUN cd trimal/source && make

RUN mv trimal/source/trimal bin/
RUN mv trimal/source/readal bin/

# outsider *requires* working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
