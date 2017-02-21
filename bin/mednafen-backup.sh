#!/bin/bash

# Set defaults
backup_dir='/data/backup/games/mednafen'

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
                          local_user=$1
                        else
                          echo "no user specified"
                          exit 1
                        fi
                        shift
                        ;;
                --user*)
                        export local_user=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;
                -d)
                        shift
                        if [ ! -z $1 ]; then
                          backup_dir=$1
                        else
                          echo "no backup dir specified"
                          exit 1
                        fi
                        shift
                        ;;
                --backup-dir*)
                        export backup_dir=`echo $1 | sed -e 's/^[^=]*=//g'`
                        shift
                        ;;

                *)
                        break
                        ;;
        esac
done

if [ -z "$local_user" ] ; then
  echo "ERROR - Please supply user using -u or --user. Exiting."
  exit
fi

source_dir="/home/${local_user}/.mednafen"

echo "$(date +%s) - INFO - backing up ${source_dir} to ${backup_dir}"

rsync -rz ${source_dir}/sav ${backup_dir}
rsync -rz ${source_dir}/mcs ${backup_dir}
