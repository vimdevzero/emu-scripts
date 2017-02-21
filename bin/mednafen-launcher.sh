#!/bin/bash

rompath='/data/games/emulator/roms'
rom=$(zenity --title="Mednafen: Load a ROM" --file-selection --filename=$rompath/ --file-filter=""*.zip" ".ZIP"")

#--file-filter=""*.ogg" "*.wav" "*.aac""

if [ $? == 1 ]; then
    echo "Cancelled."
else
#    mednafen -fs 1 "$rom"
  mednafen -fs 0 "${rom}"
fi
