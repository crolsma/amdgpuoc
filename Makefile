# amdgpuoc Makefile.

.POSIX:
name = amdgpuoc
sbin = /usr/local/sbin
conf = /usr/local/etc
init = /etc/systemd/system

install: $(sbin)/$(name) $(conf)/$(name).conf $(init)/$(name).service

$(sbin)/$(name): $(name)
	mkdir -p -- $(sbin)
	cp -- $< $@
	chmod -- u+x $@

$(conf)/$(name).conf: $(name).conf
	mkdir -p -- $(conf)
	cp -- $< $@

$(init)/$(name).service: $(name).service
	mkdir -p -- $(conf)
	cp -- $< $@
