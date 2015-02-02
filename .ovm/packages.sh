#!/bin/bash
packages="zip unzip libaio perl"

rpm --quiet --query $packages || yum --quiet -y --disablerepo=* --enablerepo=*ol6_latest install $packages

