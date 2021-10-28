# amdgpuoc Makefile.

.POSIX:
prefix = /usr/local

install: $(prefix)/sbin/amdgpuoc
install: $(prefix)/etc/amdgpuoc.conf
install: $(prefix)/lib/systemd/system/amdgpuoc.service

$(prefix)/sbin/amdgpuoc: amdgpuoc
	mkdir -p -- $(@D)
	cp -- $? $@
	chmod -- u+x $@

$(prefix)/etc/amdgpuoc.conf: amdgpuoc.conf
	mkdir -p -- $(@D)
	cp -- $? $@

$(prefix)/lib/systemd/system/amdgpuoc.service: amdgpuoc.service
	mkdir -p -- $(@D)
	cp -- $? $@

uninstall:
	rm -f -- $(prefix)/sbin/amdgpuoc \
	         $(prefix)/etc/amdgpuoc.conf \
		 $(prefix)/lib/systemd/system/amdgpuoc.service
