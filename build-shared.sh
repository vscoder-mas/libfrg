#!/bin/sh

PNAME="frg"
PLIB="lib${PNAME}.so.1"
PDEMO="${PNAME}_demo-shared"
PP2F="png2${PNAME}-shared"

g++ -Wall -shared -Wl,-soname,${PLIB} reader/*.c writer/frg_private/bgr_zip/*.cpp writer/frg_private/*.cpp writer/*.cpp -o "${PLIB}" -llz4
g++ -Wall demo/frg_demo.cpp "${PLIB}" -o "${PDEMO}"
g++ -Wall demo/png2frg.cpp "${PLIB}" -o "${PP2F}" -lpng15
