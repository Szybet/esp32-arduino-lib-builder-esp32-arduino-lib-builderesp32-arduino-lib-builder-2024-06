#!/bin/bash

if [ ! -d defconfigs ]; then
    mkdir defconfigs
    cp app/esp32-arduino-lib-builder/configs/* defconfigs/
else
    cp defconfigs/* app/esp32-arduino-lib-builder/configs/
fi

#truncate -s 0 app/esp32-arduino-lib-builder/configs/defconfig.common

get_sdkconfig () {
    local remote_sdk_config=$1
    local local_sdk_config=$2

    curl https://raw.githubusercontent.com/Szybet/InkWatchy/master/resources/tools/buildTime/$remote_sdk_config >> app/esp32-arduino-lib-builder/configs/$local_sdk_config
    #awk -i inplace '!seen[$0]++' app/esp32-arduino-lib-builder/configs/$local_sdk_config
}

get_sdkconfig sdkconfig-watchy-2.defaults defconfig.esp32
get_sdkconfig sdkconfig-watchy-3.defaults defconfig.esp32s3
get_sdkconfig sdkconfig-yatchy.defaults defconfig.esp32c6

sed -i '/CONFIG_PARTITION_TABLE_CUSTOM/d' app/esp32-arduino-lib-builder/configs/*
sed -i '/CONFIG_PARTITION_TABLE_CUSTOM_FILENAME/d' app/esp32-arduino-lib-builder/configs/*
sed -i '/CONFIG_PARTITION_TABLE_FILENAME/d' app/esp32-arduino-lib-builder/configs/*