#!/bin/bash

# This script will setup XiangShan develop environment automatically

# Init submodules
git submodule update --init --recursive DRAMsim3 NEMU NutShell nexus-am
git submodule update --init XiangShan && make -C XiangShan init;

# Setup XiangShan environment variables
source env.sh
# OPTIONAL: export them to .bashrc

echo XS_PROJECT_ROOT: ${XS_PROJECT_ROOT}
echo NEMU_HOME: ${NEMU_HOME}
echo AM_HOME: ${AM_HOME}
echo NOOP_HOME: ${NOOP_HOME}

