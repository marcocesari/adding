#!/bin/bash
set -e

docker build -t jupyterlab .
docker run -ti --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd):/home/jovyan/work jupyterlab
