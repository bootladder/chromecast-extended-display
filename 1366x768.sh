#!/bin/bash
Xephyr -br -ac -noreset -screen 1366x768 :1 &
sleep 1
DISPLAY=:1 awesome &
sleep 1
DISPLAY=:1 chromium-browser &

