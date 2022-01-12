#!/bin/sh

notify-send "Loading Doppler Radar..." "Please wait..."

mpv --no-osc --loop-file=inf "https://radar.weather.gov/ridge/lite/CENTGRLAKES_loop.gif"
