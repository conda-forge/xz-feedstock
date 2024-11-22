#!/bin/bash

set -euxo pipefail

make install

if [[ "${PKG_NAME}" != "xz-static" ]]; then
    rm -rf ${PREFIX}/lib/*.a
fi

if [[ "${PKG_NAME}" != "xz-gpl-tools" ]]; then
    rm ${PREFIX}/share/doc/xz/COPYING.GPLv2
    rm ${PREFIX}/bin/{lzcat,lzcmp,lzdiff,lzegrep,lzfgrep,lzgrep,lzless,lzmore,xzcat,xzcmp,xzdiff,xzegrep,xzfgrep,xzgrep,xzless,xzmore}
    rm ${PREFIX}/share/man/man1/{lzcat,lzcmp,lzdiff,lzegrep,lzfgrep,lzgrep,lzless,lzmore,xzcat,xzcmp,xzdiff,xzegrep,xzfgrep,xzgrep,xzless,xzmore}.1
fi

if [[ "${PKG_NAME}" != "xz-tools" ]]; then
    rm ${PREFIX}/share/doc/xz/COPYING.0BSD
    rm ${PREFIX}/bin/{lzma,lzmadec,lzmainfo,xz,unlzma,xzdec,unxz}
    rm ${PREFIX}/share/man/man1/{lzma,lzmadec,lzmainfo,xz,unlzma,xzdec,unxz}.1
fi
