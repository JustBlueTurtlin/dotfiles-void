#!/usr/bin/env bash

# Terminate already running bar instances
pkill -q polybar

# Launch bars
polybar -r primary &
polybar -r secondary &
