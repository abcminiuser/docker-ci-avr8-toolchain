FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Common tools
RUN apt-get update && \
    apt-get -y install make git cppcheck doxygen unzip

# AVR8 toolchain (distro version) and updated device headers
RUN apt-get -y install gcc-avr binutils-avr avr-libc avrdude
COPY AVR8/avr8-headers.zip /usr/lib/avr/include/
RUN cd /usr/lib/avr/include/ && unzip -o avr8-headers.zip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
