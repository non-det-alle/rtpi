#!/bin/sh

KERNEL=kernel8

sudo cp /boot/firmware/$KERNEL.img /boot/firmware/$KERNEL-$(date +"%Y%m%d_%H%M%S").img

sudo make -C linux/ modules_install
sudo cp linux/arch/arm64/boot/dts/broadcom/*.dtb /boot/firmware/
sudo cp linux/arch/arm64/boot/dts/overlays/*.dtb* /boot/firmware/overlays/
sudo cp linux/arch/arm64/boot/dts/overlays/README /boot/firmware/overlays/
sudo cp linux/arch/arm64/boot/Image /boot/firmware/$KERNEL.img
