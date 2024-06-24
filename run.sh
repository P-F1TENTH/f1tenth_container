#!/bin/bash

if ! [ -d "src" ]; then
	echo "Error: directory `src` not found. Please run this script from the root of the f1tenth_docking repository."
	exit 1
fi

docker run \
  -it \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --privileged \
  --network=host \
  --device=/dev/ttyACM0 \
  --device=/dev/ttyUSB0 \
  --device=/dev/ttyUSB1 \
  --device=/dev/ttyUSB2 \
  --device=/dev/input/js0 \
  --volume "${PWD}"/src:/root/ws/src \
  --name=f1tenth_docking_ros \
  f1tenth_docking_ros \
  bash
