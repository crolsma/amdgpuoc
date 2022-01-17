# amdgpuoc Makefile.

.POSIX:

prefix = /usr/local

install: $(prefix)/sbin/amdgpuoc
install: $(prefix)/etc/amdgpuoc.conf
install: $(prefix)/lib/systemd/system/amdgpuoc.service

$(prefix)/sbin/amdgpuoc: $(prefix)/sbin
$(prefix)/sbin/amdgpuoc: amdgpuoc
  cp -- amdgpuoc $@
  chmod -- u+x $@

$(prefix)/etc/amdgpuoc.conf: $(prefix)/etc
$(prefix)/etc/amdgpuoc.conf: amdgpuoc.conf
  cp -- amdgpuoc.conf $@

$(prefix)/lib/systemd/system/amdgpuoc.service: $(prefix)/lib/systemd/system
$(prefix)/lib/systemd/system/amdgpuoc.service: amdgpuoc.service
  cp -- amdgpuoc.service $@

$(prefix)/sbin:
  mkdir -p -- $@

$(prefix)/etc:
  mkdir -p -- $@

$(prefix)/lib/systemd/system:
  mkdir -p -- $@

uninstall:
  rm -f -- $(prefix)/sbin/amdgpuoc     \
           $(prefix)/etc/amdgpuoc.conf \
           $(prefix)/lib/systemd/system/amdgpuoc.service
