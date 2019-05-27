# Example host distro
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    make gcc

RUN git clone --depth=5 https://github.com/scapella/trimal

RUN mv trimal/source && make

# outsider *requires* working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
