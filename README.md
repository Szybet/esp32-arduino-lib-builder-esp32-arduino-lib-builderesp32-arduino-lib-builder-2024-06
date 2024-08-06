# inkwatchy-lib-builder
Some guide, container for the fork here: https://github.com/Szybet/esp32-arduino-lib-builder

Install on your host system: 
```
sudo pacman -S docker docker-buildx
sudo systemctl enable --now docker
```

Then
```
docker rmi -f eal:v1
```

Then
```
docker build --no-cache -t eal:v1 .
```

Enter the image
```
sudo rm -rf app/
mkdir app/
chmod 777 app/
setfacl -Rdm u::rwx,g::rwx,o::rwx app/
docker run -it -v $PWD/app:/app/ eal:v1 /bin/bash
```

prepare a bit
```
mkdir -p out/package/
git clone https://github.com/Szybet/esp32-arduino-lib-builder.git
cd esp32-arduino-lib-builder/
```

Maybe apply sdkconfig
```
./apply_sdkconfig.sh
```

Maybe build
```
./build.sh -t esp32,esp32s3,esp32c6 -c /app/out/ -e -A tags/3.0.4 -I tags/v5.3
```

If that won't work (it won't)
https://github.com/espressif/esp-idf/commit/5c57dfe9490f85ff5c4e02febc598c1bb5ec7632
```
./build.sh -t esp32,esp32s3,esp32c6 -c /app/out/ -e -A tags/3.0.4 -i 5c57dfe9490f85ff5c4e02febc598c1bb5ec7632
```

**Important: `-c /app/out/` with `/` at the end of the path?**

If something crashes, check if it still runs
```
docker ps
```
If git fails, maybe
```
git config --global core.compression 0
```
If git complains about safe dir...
```
git config --system --replace-all safe.directory '*'
```
