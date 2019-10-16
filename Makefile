#!/usr/bin/make -f

# This file is part of nftables-persistent
# Copyright (C) 2019 Adrian Ban
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version.

PREFIX=/
DEST=$(DESTDIR)$(PREFIX)

all:

clean:

install:
	install -d $(DEST)/usr/sbin
	install -d $(DEST)/usr/share/nftables-persistent
	install -d $(DEST)/usr/share/nftables-persistent/plugins.d
	# Main wrapper
	install nftables-persistent $(DEST)/usr/sbin
	# Systemd
	install -d $(DEST)/lib/systemd/system
	install --mode=644 systemd/* $(DEST)/lib/systemd/system
	# Manual
	install -d $(DEST)/usr/share/man/man8
	install --mode=644 nftables-persistent.8 $(DEST)/usr/share/man/man8

install-plugins:
	# Plugins
	install plugins/* $(DEST)/usr/share/nftables-persistent/plugins.d
