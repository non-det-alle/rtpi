# PREEMPT_RT patch the Raspberry Pi 3B kernel

Useful links for RT patching the kernel:

- <https://wiki.linuxfoundation.org/realtime/documentation/known_limitations>
- <https://www.raspberrypi.com/documentation/computers/linux_kernel.html>

Tested on kernel 6.1.77 and Raspberry OS Bookworm ([link to exact version](https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2023-10-10/)).

The `linux/` contains a submodule with the kernel code already patched (even if it's quite easy to do yourself). You can pull the contents by cloning with `--recurse-submodules --shallow-submodules` (second option is there to avoid pulling the full kernel repo, which is big).

Cross compile the kernel following the ***indications in the second link***.
Remember to configure full real-time capabilities with menu_config before compilation.

## Installation

Transfer linux folder as follows:

```bash
rsync -avuzh -e ssh linux/ alle@rpi0:rtpi/linux/
```

Remember to append `dwc_otg.fiq_enable=0 dwc_otg.fiq_fsm_enable=0` to `/boot/cmdline.txt`

Run the `install.sh` script.
