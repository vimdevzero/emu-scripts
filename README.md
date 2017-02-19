# emu-scripts

Useful emulator scripts for a linux machine

It is generally assumed the following files are found in the following places:
roms   = /data/games/emulator/roms/<SYSTEM>/
bios's = /data/games/emulator/bios

Where <SYSTEM> are the system dir names used in retropie.

Conf includes mednafen config which uses bluetooth ps3 controller for gba - I've removed the nonsense that gets added in there due to the ps3 controller providing analogue and digital input for buttons.

I recommend also using jstest-gtk to set the deadzone on the accelerometers to a massive ammount so that they dont create random inputs.
