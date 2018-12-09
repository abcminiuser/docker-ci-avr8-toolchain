FROM archlinux/base:latest

RUN pacman --noconfirm -Syu && \
	pacman --noconfirm -S avr-gcc avr-libc avrdude make git cppcheck doxygen

COPY avr8-headers.zip /usr/avr/include/
RUN pacman --noconfirm -S unzip && \
	cd /usr/avr/include/ && unzip -o avr8-headers.zip

CMD ["/bin/bash"]
