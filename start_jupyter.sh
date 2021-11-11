#!/bin/bash
set -e

docker build -t jupyterlab .
docker run -p 8888:8888 --user root -e GRANT_SUDO=yes -e JUPYTER_ENABLE_LAB=yes -v $HOME:/home/jovyan/work jupyterlab
