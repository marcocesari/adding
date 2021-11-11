FROM jupyter/scipy-notebook

USER root

# ffmpeg for matplotlib anim & dvipng for latex labels
RUN apt-get update && \
    apt-get install -y --no-install-recommends htop jq && \
    rm -rf /var/lib/apt/lists/*

USER jovyan

# https://ipycanvas.readthedocs.io/en/latest/installation.html#using-conda
RUN conda install -c conda-forge --quiet --yes \
    nodejs \
    ipycanvas \
    && \
    conda clean --all -f -y && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager ipycanvas --no-build && \
    jupyter lab build -y && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    rm -rf "/home/jovyan/.cache/yarn" && \
    rm -rf "/home/jovyan/.node-gyp"

COPY ./git_config /home/jovyan/.gitconfig
COPY ./git_credentials /home/jovyan/.git-credentials

WORKDIR /home/jovyan
RUN git config --global credential.helper store
RUN git clone https://github.com/marcocesari/playground.git
