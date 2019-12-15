#!/bin/sh

PNAME="frg"
PDEMO="${PNAME}_demo"
PP2F="png2${PNAME}"

g++ -Wall reader/*.c writer/frg_private/bgr_zip/*.cpp writer/frg_private/*.cpp writer/*.cpp demo/frg_demo.cpp -o "${PDEMO}" -llz4
g++ -Wall reader/*.c writer/frg_private/bgr_zip/*.cpp writer/frg_private/*.cpp writer/*.cpp demo/png2frg.cpp -o "${PP2F}" -llz4 -lpng15
