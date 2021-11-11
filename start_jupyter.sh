#!/bin/bash
set -e

docker build -f Dockerfile-Jupyter -t jupyterlab .
docker build -f Dockerfile-Playground --no-cache -t playground .
docker run -p 8888:8888 --user root -e GRANT_SUDO=yes -e JUPYTER_ENABLE_LAB=yes -v $HOME:/home/jovyan/work playground
