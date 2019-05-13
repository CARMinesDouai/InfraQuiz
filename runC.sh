#!/bin/bash

docker run -it -v $(pwd)/c:/c dockerc gcc -o /c/bin/input /c/src/input.c
docker run -it -v $(pwd)/c:/c dockerc /c/bin/input
