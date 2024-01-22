#!/bin/bash
set -euo pipefail

cmake \
  -S . \
  -B build \
  -DILI9488=ON \
  -DGPIO_TFT_DATA_CONTROL=25 \
  -DGPIO_TFT_RESET_PIN=24 \
  -DGPIO_TFT_BACKLIGHT=17 \
  -DSPI_BUS_CLOCK_DIVISOR=10 \
  -DUSE_DMA_TRANSFERS=OFF \
  -DDISPLAY_INVERT_COLORS=ON \
  -DDISPLAY_ROTATE_180_DEGREES=OFF \
  -DDISPLAY_CROPPED_INSTEAD_OF_SCALING=OFF \
  -DSTATISTICS=0 \
  -DARMV8A=ON \
  ..
make -C build -j4
sudo killall fbcp-ili9341 2>&1 || true
sudo cp ./build/fbcp-ili9341 /usr/bin/fbcp-ili9341
sudo ./build/fbcp-ili9341
#
# /boot/config.txt
#
hdmi_group=2
hdmi_mode=87
hdmi_cvt=640 576 60 1 0 0 0
hdmi_force_hotplug=1
display_rotate=0
