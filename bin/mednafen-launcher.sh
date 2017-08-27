#!/bin/bash

rompath='/data/games/emulator/roms'
rom=$(zenity --title="Mednafen: Load a ROM" --file-selection --filename=$rompath/ --file-filter=""*.zip" "*.ZIP" "*.md" "*.cue"")

#--file-filter=""*.ogg" "*.wav" "*.aac""

if [ $? == 1 ]; then
    echo "Cancelled."
else
#    mednafen -fs 1 "$rom"
  if [ -z "$1" ] ; then
    mednafen -fs 0 "${rom}"
  else
    mednafen -fs $1 "${rom}"
  fi
fi
