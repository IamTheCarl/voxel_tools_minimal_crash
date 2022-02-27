#!/bin/bash

set -e

WORKSPACE=`dirname $0 | xargs dirname | xargs realpath`

echo Workspace location: ${WORKSPACE}

rsync -r ${WORKSPACE}/godot/ ${GODOT_BUILD_DIR}
rsync -r ${WORKSPACE}/godot_voxel/ ${GODOT_BUILD_DIR}/modules/voxel

cd ${GODOT_BUILD_DIR}
scons -j$(nproc) platform=windows target=release_debug bits=64

export PATH=${PATH}:${GODOT_BUILD_DIR}/bin/