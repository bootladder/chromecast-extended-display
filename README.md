more info here: <https://www.bootladder.com/2018/12/20/chromecast-1080p-as-external-display.html>

With a Chrome Cast and a Linux host, it only mirrors a tab or a desktop.
It can't extend a desktop.  
Also, you can't get resolutions higher than your host's resolution.  
But here's a workaround, where another X server is used to run Chrome,
and so you can get the other desktop on the Chrome Cast.  
The last thing piece is to create a virtual display using `xrandr` for that X server,
so you can use `arandr` to allow your mouse to go between the 2.
  
A stab at automating it looks like this; missing piece is that the ChromeCast should be configured by a command line.
```
#!/bin/bash
Xephyr -br -ac -noreset -screen 1920x1080 :1 &
sleep 1
DISPLAY=:1 awesome &
sleep 1
DISPLAY=:1 chromium-browser &
```
  
Of course set your display number ie. `:1` and your window manager accordingly.
