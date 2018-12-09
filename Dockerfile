FROM archlinux/base:latest

# Common tools
RUN pacman --noconfirm -Syu && \
	pacman --noconfirm -S make git cppcheck doxygen unzip

# AVR8 toolchain (distro version) and updated device headers
RUN pacman --noconfirm -S avr-gcc avr-libc avrdude
COPY AVR8/avr8-headers.zip /usr/avr/include/
RUN cd /usr/avr/include/ && unzip -o avr8-headers.zip

# AVR32 toolchain (old binary release) and device headers
ADD AVR32/avr32-gnu-toolchain-3.4.3.820-linux.any.x86_64.tar.gz /avr32-toolchain
RUN for f in /avr32-toolchain/avr32-gnu-toolchain-linux_x86_64/bin/avr32-*; do ln -s $f /usr/bin/`basename $f`; done
COPY AVR32/avr32-headers-6.2.0.742.zip /avr32-toolchain/avr32-gnu-toolchain-linux_x86_64/avr32/include
RUN cd /avr32-toolchain/avr32-gnu-toolchain-linux_x86_64/avr32/include && unzip -o avr32-headers-6.2.0.742.zip

CMD ["/bin/bash"]
