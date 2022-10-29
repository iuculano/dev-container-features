#!/bin/sh
set -e


if [[ $(dpkg --print-architecture) = 'amd64' ]]; then 
    architecture='x86_64-linux'
else
    architecture='aarch64-linux'
fi

download_url=$(curl https://ziglang.org/download/index.json | jq ".${VERSION}[\"${architecture}\"].tarball")
curl $download_url -o zig.tar.xz

sudo mkdir /opt/zig-lang
tar -xvf zig.tar.xz -C /opt/zig-lang
sudo ln -s /opt/zig-lang/zig /usr/bin/
