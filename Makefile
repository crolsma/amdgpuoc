# amdgpuoc Makefile.

.POSIX:
sbin = amdgpuoc
conf = amdgpuoc.conf
init = amdgpuoc.service
sbin_target = /usr/sbin/$(sbin)
conf_target = /etc/$(conf)
init_target = /etc/systemd/system/$(init)

install: $(sbin_target) $(conf_target) $(init_target)

$(sbin_target): $(sbin)
	cp $< $@
	chmod u+x $@

$(conf_target): $(conf)
	cp $< $@

$(init_target): $(init)
	cp $< $@
