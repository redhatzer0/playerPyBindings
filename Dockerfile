FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget build-essential cmake python python-dev swig pkg-config ruby-dev
RUN cd /tmp && wget "https://vorboss.dl.sourceforge.net/project/playerstage/Player/3.0.2/player-3.0.2.tar.gz"
RUN cd /tmp && tar xzf player-3.0.2.tar.gz && rm /tmp/player-3.0.2.tar.gz
RUN mkdir /tmp/player-3.0.2/build && cd /tmp/player-3.0.2/build && cmake ../ && make && make install
COPY test.py /
