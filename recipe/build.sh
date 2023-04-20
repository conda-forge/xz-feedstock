#!/bin/bash

autoreconf -vfi

./configure --prefix=${PREFIX}  \
            --build=${BUILD}    \
            --host=${HOST}

make -j${CPU_COUNT} ${VERBOSE_AT}

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  make check
fi
