# amdgpuoc Makefile.
.POSIX:

prefix = /usr/local

install: $(prefix)/sbin/amdgpuoc
install: $(prefix)/etc/amdgpuoc.conf
install: /etc/systemd/system/amdgpuoc.service

$(prefix)/sbin/amdgpuoc: $(prefix)/sbin
$(prefix)/sbin/amdgpuoc: amdgpuoc
	sed 's,$$prefix,$(prefix),g' amdgpuoc > $@
	chmod -- u+x $@

$(prefix)/etc/amdgpuoc.conf: $(prefix)/etc
$(prefix)/etc/amdgpuoc.conf: amdgpuoc.conf
	cp -- amdgpuoc.conf $@

/etc/systemd/system/amdgpuoc.service: /etc/systemd/system
/etc/systemd/system/amdgpuoc.service: amdgpuoc.service
	sed 's,$$prefix,$(prefix),g' amdgpuoc.service > $@

$(prefix)/sbin:
	mkdir -p -- $@

$(prefix)/etc:
	mkdir -p -- $@

/etc/systemd/system:
	mkdir -p -- $@

uninstall:
	rm -f -- $(prefix)/sbin/amdgpuoc     \
	         $(prefix)/etc/amdgpuoc.conf \
	         /etc/systemd/system/amdgpuoc.service
