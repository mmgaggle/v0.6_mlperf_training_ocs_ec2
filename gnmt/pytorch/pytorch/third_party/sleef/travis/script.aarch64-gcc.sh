#!/bin/bash
set -ev
cd /build/build-cross
make -j 2 all
export CTEST_OUTPUT_ON_FAILURE=TRUE
ctest -j 2
make install
