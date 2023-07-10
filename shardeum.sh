#!/bin/bash

if exists curl; then
	echo ''
else
  sudo apt install curl -y < "/dev/null"
fi
curl -s https://github.com/cryptocaju/shardeum/logocaju.sh | bash
echo "==================================================="
sleep 2
sudo apt update && sudo apt-get install software-properties-common -y
