#!/bin/bash
dd if=/dev/zero of=/EMPTY bs=1M
sync
sync
rm -f /EMPTY; shutdown -h now
