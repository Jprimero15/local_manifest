#!/bin/bash

# initialize build env
source build/envsetup.sh

# system/netd
repopick 14 # netd: Allow devices to force-add directly-connected routes

# bionic
repopick 13 # Actually restore pre-P mutex behavior
