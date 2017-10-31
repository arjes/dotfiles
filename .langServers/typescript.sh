#!/bin/bash

docker run -i --mount type=bind,src=$HOME,dst=$HOME -a STDOUT -a STDIN 359d437acf11 <&0
