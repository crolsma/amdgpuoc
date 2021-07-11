**Summary:**
  A CLI utility to overclock AMD GPUs.  Small, simple, and easy to use and modify.  Interacting with the sysfs by hand is tedious; this utility makes that easier without becoming too complicated in itself.

  init starts script -> reads from input -> writes to sysfs files
  
  For more information about overclocking and the amdgpu driver: https://www.kernel.org/doc/html/latest/gpu/amdgpu.html
  
  For more information about the amdgpu.ppfeaturemask parameter: drivers/gpu/drm/amd/include/amd_shared.h from the kernel source tree.

**Warning:**
  Research your own GPU and adjust the .conf file as needed before running this utility.  Instability and damage can occure due to overclocking.  Not all AMD GPUs can be overclocked in this manner.

**Usage:**
  amdgpuoc [files|-]

  Calling amdgpuoc with no arguments uses the system-wide .conf file.  Specifying an argument as '-' uses STDIN for input.  Any other arguments are treated as user-specified .conf files.

**Requirements:**
  - An AMD GPU
  - Linux kernel >= 4.20
  - Kernel parameter amdgpu.ppfeaturemask=0xffffffff
  - POSIX awk
  - systemd

**Installation:**
  1. In /etc/default/grub, append amdgpu.ppfeaturemask=0xffffffff to GRUB_CMDLINE_LINUX_DEFAULT value.
  1. `grub2-mkconfig -o /boot/grub2/grub.cfg`
  1. `make install`
  1. `systemctl enable amdgpuoc`
  1. Reboot.

**Configuration:**
  Configuration is done by editing /usr/local/etc/amdgpuoc.conf.  See the sample .conf file for details.
