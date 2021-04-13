#!/bin/bash
echo " ______  _                                             "
echo "(_) |   (_\  /                 o                       "
echo "    |      \/     _   _   ,_       _   _  _    __   _  "
echo "  _ |----- /\   |/ \_|/  /  |  |  |/  / |/ |  /    |/  "
echo " (_/     _/  \_/|__/ |__/   |_/|_/|__/  |  |_/\___/|__/"
echo "               /|                                      "
echo "               \|                                      "
UNDEFINED="undefined"
HOST=UNDEFINED
if [ -z "$TIME_B_PINGS" ]
  then
    TIMEBPINGS=5
  else
    TIMEBPINGS=$TIME_B_PINGS
fi
if [ -z "$1" ]
  then
    echo "No arguments supplied, searching to use HOST_TO_PING"
    if [ -z "$HOST_TO_PING" ]
        then
            echo "The ENV is unset."
        else
            HOST_PING=$HOST_TO_PING
    fi
  else
    HOST_PING=$1
fi
if [ "$HOST_PING" = "$UNDEFINED" ]
  then
    echo "Exiting."
  else
    echo "Ping to $HOST_PING every $TIME_B_PINGS seconds."
    ping $HOST_PING -i $TIMEBPINGS | while read pong; do echo $(date +%F.%T): $pong; done
fi