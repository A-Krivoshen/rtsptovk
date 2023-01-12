#!/bin/sh

if [ "$#" -lt 2 ]; then
  >&2 echo "Arguments: IP_CAMERA_ADDRESS LIVE_ID [TIMELAPSE_ID]"
  exit 1
fi

IP_CAMERA_ADDRESS=$1
LIVE_ID=$2

>&2 echo "IP_CAMERA_ADDRESS=$IP_CAMERA_ADDRESS"
>&2 echo "LIVE_ID=$LIVE_ID"

## Note: VK will not accept a stream without audio, even if there is none
  exec ffmpeg \
    -rtsp_transport tcp -i $IP_CAMERA_ADDRESS \
    -tune zerolatency -vcodec libx264 -t 12:00:00 -pix_fmt + -c:v copy -c:a aac -strict experimental -f flv rtmp://ovsu.mycdn.me/input/$LIVE_ID \


