# amdgpuoc Makefile.

.POSIX:
sbin_dep = amdgpuoc
conf_dep = amdgpuoc.conf
init_dep = amdgpuoc.service
sbin_dir = /usr/local/sbin
conf_dir = /usr/local/etc
init_dir = /usr/local/lib/systemd/system
sbin_tgt = $(sbin_dir)/$(sbin_dep)
conf_tgt = $(conf_dir)/$(conf_dep)
init_tgt = $(init_dir)/$(init_dep)

install: $(sbin_tgt) $(conf_tgt) $(init_tgt)

$(sbin_tgt): $(sbin_dep)
	mkdir -p -- $(sbin_dir)
	cp -- $< $@
	chmod -- u+x $@

$(conf_tgt): $(conf_dep)
	mkdir -p -- $(conf_dir)
	cp -- $< $@

$(init_tgt): $(init_dep)
	mkdir -p -- $(init_dir)
	cp -- $< $@
