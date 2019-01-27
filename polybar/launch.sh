#!/usr/bin/env bash

# kill already runnig polybar instances
killall -q polybar

# wait a sec till it dies
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# determines the amount of monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar_1 &
  done
else
  polybar --reload bar_1 &
fi

# Launch bar
# polybar bar_1
