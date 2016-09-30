#!/bin/bash
WIDTH=300                                                                       
HEIGHT=50                                                                       
                                                                                
# This script shows an alert using dzen                                         
screenWidth=$(xdpyinfo | grep 'dimensions' | egrep -o "[0-9]+x[0-9]+ pixels" | sed "s/x.*//")
screenHeight=$(xdpyinfo | grep 'dimensions' | egrep -o "[0-9]+x[0-9]+ pixels" | egrep -o "x[0-9]*" | sed "s/x//")
let "middleY = $screenHeight / 2 - ($HEIGHT/2)"                                 
let "middleX = $screenWidth / 2 - ($WIDTH)"                                   

if [ "${2}" == "top" ]; then                                                    
        echo $1 | dzen2 -fn "DejaVu Sans Mono 8" -p $3 -h $HEIGHT               
else                                                                            
        echo $1 | dzen2 -fn "DejaVu Sans Mono 8" -p $3 -y $middleY -x $middleX -h $HEIGHT -w $WIDTH &
fi

# if [ "${2}" == "top" ]; then                                                    
    #    echo $1 | dzen2 -fn "DejaVu Sans Mono 8" -p $3 -h $HEIGHT -bg '#267158'      
#else                                                                            
   #     echo $1 | dzen2 -fn "-*-liberation mono-bold-*-*-*-*-*-*-*-*-*-*-*" -p $3 -y $middleY -x $middleX -h $HEIGHT -w $WIDTH -bg '#267158' -fg '#003926'  &
#fi
