#!/bin/sh

PNAME="fgr"
PLIB="lib${PNAME}.so.1"
PDEMO="${PNAME}_demo-shared"

g++ -Wall -shared -Wl,-soname,${PLIB} reader/*.c writer/frg_private/bgr_zip/*.cpp writer/frg_private/*.cpp writer/*.cpp -o "${PLIB}" -llz4
g++ -Wall demo/frg_demo.cpp "${PLIB}" -o "${PDEMO}"
