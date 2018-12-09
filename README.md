CI: AVR 8-bit Toolchain
---

Internal image for Continuous Integration purposes, not for general use.

Basic Arch Linux image with the Atmel AVR8 Toolchain installed, along with
various standard build tools (e.g. GNU Make, Git). Bleeding edge version of the
toolchain.

This also contains an old binary release of the AVR32-GCC toolchain from Atmel,
for build testing purposes. The AVR32 toolchain appears to be no longer actively
supported on Linux - do not use any compiled applications from this image on
real hardware, use the latest Atmel toolchain on Windows instead.
