FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Common tools
RUN apt-get update && \
    apt-get -y install make git cppcheck doxygen unzip

# AVR8 toolchain (distro version) and updated device headers
RUN apt-get -y install gcc-avr binutils-avr avr-libc avrdude
COPY AVR8/avr8-headers.zip /usr/lib/avr/include/
RUN cd /usr/lib/avr/include/ && unzip -o avr8-headers.zip

# AVR32 toolchain (old binary release) and device headers
ADD AVR32/avr32-gnu-toolchain-3.4.3.820-linux.any.x86_64.tar.gz /avr32-toolchain
RUN for f in /avr32-toolchain/avr32-gnu-toolchain-linux_x86_64/bin/avr32-*; do ln -s $f /usr/bin/`basename $f`; done

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
