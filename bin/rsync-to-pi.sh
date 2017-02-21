#!/bin/bash

# Set defaults
pi_user='pi'
pi_address='retropie'

while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "$0 - sync roms to retropi"
                        echo " "
                        echo "$0 [options]"
                        echo " "
                        echo "options:"
                        echo "-h, --help                show brief help"
                        echo "-u, --user                define pi user (default pi)"
                        echo "-a, --address             define pi network address (default retropie)"
                        echo "-d, --data-dir            define local roms dir (default /data/games/emulator/roms)"
                        exit 0
                        ;;
                -u)
                        shift
                        if [ ! -z $1 ]; then
                          pi_user=$1
                        else
                          echo "no user specified"
                          exit 1
                        fi
                        shift
                        ;;
                --user*)
                        export pi_user=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -a)
                        shift
                        if [ ! -z $1 ]; then
                          pi_address=$1
                        else
                          echo "no address specified"
                          exit 1
                        fi
                        shift
                        ;;
                --address*)
                        export pi_address=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -d)
                        shift
                        if [ ! -z $1 ]; then
                          local_roms_dir=$1
                        else
                          echo "no roms dir specified"
                          exit 1
                        fi
                        shift
                        ;;
                --data-dir*)
                        export local_roms_dir=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;

                *)
                        break
                        ;;
        esac
done

echo "$(date +%s) - INFO - logging on as $pi_user@$pi_address"

local_roms_dir='/data/games/emulator/roms'

if ! arp -na | grep -qi 'b8:27:eb' ; then
  echo 'ERROR - no pis on network'
  exit 1
fi

rsync -lrz --progress ${local_roms_dir}/* ${pi_user}@${pi_address}:RetroPie/roms/
