#!/bin/bash
dd if=/dev/zero of=/EMPTY bs=1m
sync
sync
rm -f /EMPTY; shutdown -h now
