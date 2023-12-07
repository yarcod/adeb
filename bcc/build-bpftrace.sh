#!/bin/bash
# This script should run within a bpftrace checkout

spath=$(
	cd "$(dirname "$0")"
	pwd -P
)
cd $spath

rm -rf build && mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=clang-13 -DCMAKE_CXX_COMPILER=clang++-13
make -j$(nproc)
make install
rm -rf build
