#!/bin/bash

docker run -i --mount type=bind,src=$HOME,dst=$HOME -a STDOUT -a STDIN b8635180d2e4 <&0
