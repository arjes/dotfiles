#!/bin/bash

docker run -i --mount type=bind,src=$HOME,dst=$HOME -a STDOUT -a STDIN arjes/ts-langserver:0.0.1 <&0
