@ECHO OFF

docker build -t jupyterlab .
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v /c/Users/cesarif/PycharmProjects:/home/jovyan/work jupyterlab
