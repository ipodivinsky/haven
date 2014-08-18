#!/bin/sh

BUILD_DIR=build/release

cmake -E make_directory $BUILD_DIR
cmake -E chdir $BUILD_DIR cmake -G "Unix Makefiles" ../../
make --no-print-directory -C $BUILD_DIR install
