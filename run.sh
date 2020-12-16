#!/bin/sh

url="http://milkymist.walle.cc/updates/2012-03-01/flickernoise"
image="flickernoise"

sdir=`dirname $0`
cat "$sdir"/readme.txt

if [ ! -f "$image" ]; then
    echo "Downloading the image file..."
    if command -v curl >/dev/null 2>&1; then
        curl -L -o "$image" "$url" || exit
    elif command -v wget >/dev/null 2>&1; then
        wget -O "$image" "$url" || exit 1
    else
        echo "You either need 'curl' or 'wget' for the download."
        exit 1
    fi
fi

if ! command -v qemu-system-lm32 >/dev/null 2>&1; then
    cat <<EOF

Error: unable to find qemu-system-lm32.
1. Try installing the qemu-system-lm32 package from your distro.
2. Or compile QEMU from source:
   git clone git://git.qemu-project.org/qemu.git
   cd qemu && ./configure --target-list=lm32-softmmu && make
   export PATH=\$PWD/lm32-softmmu:\$PATH
EOF
    exit 1
fi

exec qemu-system-lm32 -M milkymist -kernel "$image"
