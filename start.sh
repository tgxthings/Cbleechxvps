#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Shrimadhav U K | gautamajay52 | MaxxRider | 5MysterySD | Other Contributors 
#
# Copyright 2022 - TeamTele-LeechX
# 
# This is Part of < https://github.com/5MysterySD/Tele-LeechX >
# All Right Reserved

## Adding Files ++++
TRACKER=`curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt -: https://ngosang.github.io/trackerslist/trackers_all_http.txt -: https://newtrackon.com/api/all -: https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt -: https://torrends.to/torrent-tracker-list/?download=latest | awk '$1' | tr '\n' ',' | cat`
ran=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
## Adding Files ----


if [[ -n $RCLONE_CONFIG_URL ]]; then
  echo "Rclone config detected 📁📁"
  wget -q $RCLONE_CONFIG_URL -O /app/rclone.conf
fi

if [[ -n $CONFIG_ENV_URL ]]; then
  echo " Found config.env File 📁📁
  wget -q $CONFIG_ENV_URL -O /app/config.env
fi

if [ -f .env ] ; then  set -o allexport; source .env; set +o allexport ; fi


echo "Starting Your Tele-LeechX... ♻️♻️"
python3 update.py && python3 -m tobrot

