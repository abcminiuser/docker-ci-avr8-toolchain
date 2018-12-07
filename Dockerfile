FROM archlinux/base:latest

RUN pacman --noconfirm -Syu && \
	pacman --noconfirm -S avr-gcc avr-libc avrdude make git cppcheck doxygen

CMD ["/bin/bash"]
