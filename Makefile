all:
	$(MAKE) -C 6
	$(MAKE) -C 6-i386
	$(MAKE) -C 7

push:
	$(MAKE) -C 6-i386 push
	$(MAKE) -C 6 push
	$(MAKE) -C 7 push
