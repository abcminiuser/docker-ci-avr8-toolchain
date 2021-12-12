FROM archlinux:latest

# Common tools
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
bsdtar -C / -xvf "$patched_glibc"
RUN pacman --noconfirm -Syu && \
	pacman --noconfirm -S make git cppcheck doxygen unzip

# AVR8 toolchain (distro version) and updated device headers
RUN pacman --noconfirm -S avr-gcc avr-libc avrdude
COPY AVR8/avr8-headers.zip /usr/avr/include/
RUN cd /usr/avr/include/ && unzip -o avr8-headers.zip

CMD ["/bin/bash"]
