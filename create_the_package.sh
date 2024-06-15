#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Error: Exactly 2 arguments are required."
  echo "Usage: $0 real_package_path repo_path"
  exit 1
fi

# Probably should be: 
# ./create_the_package.sh ~/.platformio/packages/framework-arduinoespressif32@3.20011.230801 /mnt/data/projects/git/arduinoespressif32-inkwatchy
# Without / at the end
real_package_path="$1" # Our package version should be framework-arduinoespressif32 @ 3.20011.230801
repo_path="$2" # Path of repo Szybet/arduinoespressif32-inkwatchy 
things_path="app"
# And in app/out/ should be the thing that should be there :D

find "$repo_path" -mindepth 1 -maxdepth 1 ! -name 'README.md' ! -name '.git' -exec rm -rf {} +

# Copy everything
cp -r $real_package_path/* $repo_path/ 
# Copy specific things
cp -r $things_path/out/tools/esp32/* $repo_path/tools/sdk/esp32/

#rm -f $repo_path/tools/sdk/esp32/platformio-build.py
#rm -f $repo_path/tools/sdk/esp32/dependencies.lock

# Copy only header files
# (cd "$real_package_path/tools/sdk/esp32/" && find . -name '*.h' -print | tar --create --files-from -) | (cd "$repo_path/tools/sdk/esp32" && tar xvfp -)

rm -rf $repo_path/libraries/*
cp -r $things_path/esp32-arduino-lib-builder/components/arduino/libraries/* $repo_path/libraries/

rm -rf $repo_path/cores
cp -r $things_path/esp32-arduino-lib-builder/components/arduino/cores $repo_path/

#cp -r $things_path/esp32-arduino-lib-builder/components/arduino/platform.txt $repo_path/
#cp -r $things_path/esp32-arduino-lib-builder/components/arduino/boards.txt $repo_path/

rm -rf $repo_path/variants
cp -r $things_path/esp32-arduino-lib-builder/components/arduino/variants $repo_path/