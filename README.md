CI: AVR-8 Toolchain
---

Internal image for Continuous Integration purposes, not for general use.

Basic Ubuntu image with the latest distro Atmel AVR8 Toolchain installed, along
with various standard build tools (e.g. GNU Make, Git).

This also contains an old binary release of the AVR32-GCC toolchain from Atmel,
for build testing purposes. The AVR32 toolchain appears to be no longer actively
supported on Linux - do not use any compiled applications from this image on
real hardware, use the latest Atmel toolchain on Windows instead.
