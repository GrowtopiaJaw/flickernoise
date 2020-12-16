QEMU Advent Calendar 2020:

Flickernoise on Milkymist
-------------------------

The LatticeMico32 (LM32) emulation of QEMU has been marked as deprecated
in the latest version of QEMU (version 5.2) ... time to say good bye to
the qemu-system-lm32 by running it one more time before it gets removed
in a future version.

This script downloads the Flickernoise GUI and starts qemu-system-lm32
with this image. The script needs 'wget' or 'curl' for the download, and
'unzip' to extract the image from the downloaded archive.

Some more information about Flickernoise and Milkymist can be found here:

 https://en.wikipedia.org/wiki/M-Labs#Milkymist_One_and_Flickernoise

Note: If you are compiling QEMU on your own, you might have to explicitely
turn on the qemu-system-lm32 binary by running the "configure" script with
"--target-list=lm32-softmmu" (it's not included by default anymore since
the support for lm32 has been marked as deprecated).

