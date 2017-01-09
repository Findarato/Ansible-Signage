#!/usr/bin/env bash

killall -9 chromium-browser
BROWSER=chromium
rm -rf /home/pi/.cache/$BROWSER
rm -rf /mnt/cache/$BROWSER

mkdir /mnt/cache/$BROWSER
ln -s /mnt/cache/$BROWSER /home/pi/.cache/
