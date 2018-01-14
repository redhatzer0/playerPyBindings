FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget build-essential cmake python python-dev swig2.0 pkg-config unzip
RUN cd /tmp && wget "https://sourceforge.net/code-snapshots/svn/p/pl/playerstage/svn/playerstage-svn-9142-code-player-trunk.zip" && unzip playerstage-svn-9142-code-player-trunk.zip && rm playerstage-svn-9142-code-player-trunk.zip && mv playerstage-svn-* player
RUN mkdir /tmp/player/build && cd /tmp/player/build && cmake ../ && make && make install
