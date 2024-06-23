#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Error: Exactly 1 argument is required."
  echo "Usage: $0 repo_path"
  exit 1
fi

REPO_PATH=$1
ARCHIVE=$(ls app/esp32-arduino-lib-builder/dist/ | head -n 1)
ARCHIVE="app/esp32-arduino-lib-builder/dist/$ARCHIVE"

rm -rf "$REPO_PATH"/*
7z x "$ARCHIVE" -o"$REPO_PATH"