#!/bin/bash

nvidia_binary_version=`modinfo nvidia --field version`
nvidia_binary="NVIDIA-Linux-x86_64-${nvidia_binary_version}.run"

mkdir -p /tmp/nvidia_setup
cd /tmp/nvidia_setup

wget -q https://us.download.nvidia.com/XFree86/Linux-x86_64/${nvidia_binary_version}/${nvidia_binary}
chmod +x ${nvidia_binary}
sudo ./${nvidia_binary} --accept-license --ui=none --no-kernel-module --no-questions
rm -rf /tmp/nvidia_setup