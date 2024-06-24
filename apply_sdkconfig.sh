#!/bin/bash

if [ ! -f defconfig.common ]; then
    cp app/esp32-arduino-lib-builder/configs/defconfig.common ./
else
    cp defconfig.common app/esp32-arduino-lib-builder/configs/defconfig.common
fi

curl https://raw.githubusercontent.com/Szybet/InkWatchy/master/resources/tools/buildTime/sdkconfig.defaults >> app/esp32-arduino-lib-builder/configs/defconfig.common

sed -i '/CONFIG_PARTITION_TABLE_CUSTOM/d' app/esp32-arduino-lib-builder/configs/defconfig.common
sed -i '/CONFIG_PARTITION_TABLE_CUSTOM_FILENAME/d' app/esp32-arduino-lib-builder/configs/defconfig.common
sed -i '/CONFIG_PARTITION_TABLE_FILENAME/d' app/esp32-arduino-lib-builder/configs/defconfig.common