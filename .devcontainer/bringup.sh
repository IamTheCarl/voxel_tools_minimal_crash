#!/bin/bash

DEV_FOLDER=`dirname $0 | xargs realpath`

${DEV_FOLDER}/install_graphics_driver.sh
${DEV_FOLDER}/build_godot.sh
