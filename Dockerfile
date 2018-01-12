FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget build-essential cmake python python-dev swig3.0 pkg-config ruby-dev
RUN cd /usr/bin && ln -s swig3.0 swig
RUN cd /tmp && wget "https://vorboss.dl.sourceforge.net/project/playerstage/Player/3.0.2/player-3.0.2.tar.gz"
RUN cd /tmp && tar xzf player-3.0.2.tar.gz && rm /tmp/player-3.0.2.tar.gz
RUN mkdir /tmp/player-3.0.2/build && cd /tmp/player-3.0.2/build && cmake ../ && make


#This is a complete hack.... I think this can/should be fixed in ./client_libs/libplayerc/bindings/python/playerc_swig_parse.py
RUN cd /tmp/player-3.0.2/build/client_libs/libplayerc/bindings/python && \
	sed -i s/"_playerc_device_t_"/"playerc_device_"/ playercPYTHON_wrap.c && \
	sed -i s/"_playerc_client_t_"/"playerc_client_"/ playercPYTHON_wrap.c && \
	sed -i s/"new__playerc_client_t"/"playerc_client_create"/ playercPYTHON_wrap.c

RUN cd /tmp/player-3.0.2/build && make install

COPY test.py /
