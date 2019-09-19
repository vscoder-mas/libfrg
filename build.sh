#!/bin/sh

PNAME="fgr"
PDEMO="${PNAME}_demo"

g++ -Wall reader/*.c writer/frg_private/bgr_zip/*.cpp writer/frg_private/*.cpp writer/*.cpp demo/frg_demo.cpp -o "${PDEMO}" -llz4
