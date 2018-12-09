FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install gcc-avr binutils-avr avr-libc avrdude make git cppcheck doxygen

COPY avr8-headers.zip /usr/lib/avr/include/
RUN apt-get -y install unzip && \
	cd /usr/lib/avr/include/ && unzip -o avr8-headers.zip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/avr"]
CMD ["/bin/bash"]
