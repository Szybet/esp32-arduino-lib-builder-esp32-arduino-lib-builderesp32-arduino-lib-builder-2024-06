For this command:
```
./build.sh -t esp32,esp32s3,esp32c6 -c /app/out/ -e -A tags/3.0.4 -i 5c57dfe9490f85ff5c4e02febc598c1bb5ec7632
```

I needed to:
- replace some strcpy with memcpy (and after that mv the directory esp rainmaker)
- in app/esp32-arduino-lib-builder/components/arduino/CMakeLists.txt to the list of target_compile_options add -Wno-maybe-uninitialized