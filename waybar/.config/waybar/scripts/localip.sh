#!/bin/sh

ip -j a | jq -r -M '.[] | select(.ifname == "wlan0").addr_info | .[] | select(.family == "inet").local'
