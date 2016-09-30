#!/bin/bash                                                                     
                                                                                
volume=$(amixer -D pulse sset Master 5%+ | egrep -o "[0-9]+%" | tail -1)                       
`$HOME/dwm/scripts/volume_notify.sh "Volume: $volume"  middle 1`
  