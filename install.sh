#!/bin/bash

FILE=/usr/local/bin/gitcp

if [ -f "$FILE" ]; then
	sudo rm /usr/local/bin/gitcp
fi

sudo cp ./script.sh /usr/local/bin/ && cd /usr/local/bin/ && sudo mv script.sh gitcp
