FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget build-essential cmake python python-dev swig pkg-config ruby-dev
COPY player-3.0.2.tar.gz /tmp
RUN cd /tmp && tar xzf player-3.0.2.tar.gz && rm /tmp/player-3.0.2.tar.gz
RUN mkdir /tmp/player-3.0.2/build && cd /tmp/player-3.0.2/build && cmake ../ && make && make install
COPY test.py /
