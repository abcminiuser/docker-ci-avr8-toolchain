FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install gcc-avr binutils-avr avr-libc avrdude make git cppcheck doxygen

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/avr"]
CMD ["/bin/bash"]
