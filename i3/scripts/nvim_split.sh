#!/usr/bin/env bash

i3-msg 'split v; exec kitty'
sleep 0.6
i3-msg 'resize set height 300 px'
