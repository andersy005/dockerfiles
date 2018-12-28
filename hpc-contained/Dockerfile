FROM continuumio/miniconda3:latest 

ENV HOME /root 
WORKDIR  /root 

RUN apt-get -y update && \
    apt-get install -y --fix-missing \
    gcc g++ kmod make \
    build-essential \
    libssl-dev \
    uuid-dev \
    squashfs-tools && \
    apt-get clean -y 

RUN git config --global user.name "andersy005" && \
    git config --global user.email "axbanihirwe@ualr.edu"

RUN conda config --set always_yes yes && \
    conda config --add channels conda-forge && \
    conda install \
          jupyterlab pytest 

RUN pip install bash_kernel && python -m bash_kernel.install
