#!/bin/bash

betterlockscreen -l dim 0.5
exists=$(ps aux | awk '{print $11}' | grep mpv)

if [ "mpv" == "$exists" ]; then
    echo '{ "command": ["set_property", "pause", true] }' | socat - /tmp/mpvsocket
fi
