FROM archlinux/base:latest

# Common tools
RUN pacman --noconfirm -Syu && \
	pacman --noconfirm -S make git cppcheck doxygen unzip

# AVR8 toolchain (distro version) and updated device headers
RUN pacman --noconfirm -S avr-gcc avr-libc avrdude
COPY AVR8/avr8-headers.zip /usr/avr/include/
RUN cd /usr/avr/include/ && unzip -o avr8-headers.zip

CMD ["/bin/bash"]
