#!/bin/bash

NOBLANK="
@xset s noblank
@xset s off
@xset -dpms
"

  printf "$DIM\n"
  pr -t -o 9 /etc/xdg/lxsession/LXDE/autostart
  printf "$OFF$GREEN$NOBLANK" | pr -t -o 9

  cat /etc/xdg/lxsession/LXDE/autostart > /etc/xdg/lxsession/LXDE/autostart.`date +%m-%d-%Y_%I:%M:%S`
  printf "$NOBLANK" >> /etc/xdg/lxsession/LXDE/autostart

    printf "$DIM\n"
  pr -t -o 9 /etc/xdg/lxsession/LXDE/autostart
  printf "$OFF\n\n" 
