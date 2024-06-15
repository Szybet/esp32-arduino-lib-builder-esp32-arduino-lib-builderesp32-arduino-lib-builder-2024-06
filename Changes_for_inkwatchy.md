Replace `app/esp32-arduino-lib-builder/configs/defconfig.esp32` with `sdkconfig-esp32`:

Changes made to the file:
```
CONFIG_ESP_INT_WDT_TIMEOUT_MS=3000
CONFIG_ESP_TASK_WDT_TIMEOUT_S=25
CONFIG_INT_WDT_TIMEOUT_MS=3000
CONFIG_TASK_WDT_TIMEOUT_S=25
```
