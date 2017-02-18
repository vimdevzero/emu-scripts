#!/bin/bash

pi_user='pi'
pi_address='retropie'
local_roms_dir='/data/games/emulator/roms'

if ! arp -na | grep -qi 'b8:27:eb' ; then
  echo 'ERROR - no pis on network'
  exit 1
fi

rsync -lrz --progress ${local_roms_dir}/* ${pi_user}@${pi_address}:RetroPie/roms/
