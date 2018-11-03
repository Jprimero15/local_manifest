#!/bin/bash

# make repopicking from lineage shorter
lospick() {
  repopick --gerrit https://review.lineageos.org $1
}


source build/envsetup.sh

# system/netd
cd system/netd
git fetch https://github.com/LineageOS/android_system_netd refs/changes/01/231201/3 && git cherry-pick FETCH_HEAD  # netd: Allow devices to force-add directly-connected routes
cd .. && cd ..

# bionic
repopick 3682 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
repopick 3684 # Actually restore pre-P mutex behavior
repopick 3683 # Revert "linker: Make platform text relocations denial optional"

# frameworks/av
repopick 3590 # libstagefright: Add more sample rates for FLAC
repopick 3679 # soundtrigger: fill in default extras from dsp
repopick 3681 # SoundTriggerHalLegacy.cpp: include errno.h

# system/sepolicy
cd system/sepolicy
git fetch https://github.com/LineageOS/android_system_sepolicy refs/changes/51/230151/1 && git cherry-pick FETCH_HEAD 
cd .. && cd ..

