#!/bin/bash

echo What is the Screen Resolution in the following format?
echo eg. 1900 1080 60.0
read res

modeline=$(cvt $res)
echo the modeline is: $modeline

echo xrandr --newmode $modeline

echo
echo Which Window Manager to open in the 2nd X Server?  eg. awesome
read wm

echo Is Chromium already running?  [y]
read chromiumrunning

echo OK I am ready
Xephyr -br -ac -noreset -screen $res :29 &
sleep 1
DISPLAY=:29 $wm &
sleep 1
DISPLAY=:29 chromium-browser &

