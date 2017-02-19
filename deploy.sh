#!/bin/bash

if [ -z "$1" ] ; then
  echo "ERROR - no username supplied"
  exit
fi 

mkdir /home/$1/bin

cp ./bin/* /home/$1/bin

chmod +x /home/$1/bin/*

cp conf/mednafen-09x.cfg /home/$1/.mednafen/mednafen-09x.cfg
