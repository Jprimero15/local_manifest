#!/bin/bash

# initialize build env
source build/envsetup.sh

# system/netd
repopick 3855 # netd: Allow devices to force-add directly-connected routes

# bionic
repopick 3682 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
repopick 3684 # Actually restore pre-P mutex behavior
repopick 3683 # Revert "linker: Make platform text relocations denial optional"

# system/core
repopick 3877 # core: Revert "Lockscreencharging: Drop condition"

# vendor/aosp
repopick 3957 # vendor: Switch back to older version of Retro
