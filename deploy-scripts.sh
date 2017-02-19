#!/bin/bash

mkdir /home/$1/bin

cp ./bin/* /home/$1/bin

chmod +x /home/$1/bin/*
