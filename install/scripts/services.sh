#!/bin/bash

sudo systemctl enable ly.service
sudo systemctl enable syncthing@$USER.service

# TODO: syncthing probably requires manual setup
