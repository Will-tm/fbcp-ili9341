#!/bin/bash
set -euo pipefail

cmake \
  -S . \
  -B build \
  -DILI9488=ON \
  -DGPIO_TFT_DATA_CONTROL=18 \
  -DGPIO_TFT_RESET_PIN=23 \
  -DGPIO_TFT_BACKLIGHT=-1 \
  -DSPI_BUS_CLOCK_DIVISOR=8 \
  -DUSE_DMA_TRANSFERS=ON \
  -DDISPLAY_INVERT_COLORS=ON \
  -DDISPLAY_ROTATE_180_DEGREES=ON \
  -DDISPLAY_CROPPED_INSTEAD_OF_SCALING=ON \
  -DDMA_TX_CHANNEL=7 \
  -DDMA_RX_CHANNEL=5 \
  -DSTATISTICS=0 \
  -DARMV8A=ON \
  ..
make -C build -j4
#sudo killall fbcp-ili9341 2>&1 || true
#sudo ./build/fbcp-ili9341

#
# /boot/config.txt
#
# hdmi_group=2
# hdmi_mode=87
# hdmi_cvt=320 288 60 1 0 0 0
# hdmi_force_hotplug=1
# display_rotate=2
# avoid_warnings=2
