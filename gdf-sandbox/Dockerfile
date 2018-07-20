FROM continuumio/miniconda3:latest

ENV HOME /root
WORKDIR /root

RUN apt-get -y update && \
    apt-get install -y --fix-missing gcc g++ kmod && \
    apt-get clean -y

# Install cudatoolkit
RUN curl -L -O https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux && \
    sh cuda_9.2.148_396.37_linux --silent --toolkit && \
    rm cuda_9.2.148_396.37_linux && \
    cat /tmp/cuda_install*.log

RUN conda config --set always_yes yes && \
    conda config --add channels conda-forge && \
    conda update --all && \
    conda install \
        make cmake \
        git bzip2 curl pandas \
        flatbuffers cffi mkl numpy openssl pip py pycparser pytest python \
        readline setuptools sqlite tk wheel xz zlib llvmlite numba arrow-cpp \
        xonsh xo && \
    conda clean --all && \
    conda info

ENTRYPOINT /opt/conda/bin/xonsh
RUN git config --global user.name "andersy005" && \
    git config --global user.email "axbanihirwe@gmail.com"

# Install libgdf
RUN git clone https://github.com/andersy005/libgdf.git && \
    cd libgdf && \
    git remote add up https://github.com/gpuopenanalytics/libgdf.git && \
    git submodule update --init --recursive
RUN mkdir -p libgdf/build && \
    cd libgdf/build && \
    cmake .. && \
    make && \
    make install && \
    cd ..

# Install pygdf
RUN git clone https://github.com/andersy005/pygdf.git && \
    cd pygdf && \
    git remote add up https://github.com/gpuopenanalytics/pygdf.git && \
    git submodule update --init --recursive
RUN cd pygdf \
    python setup.py install && \
    cd ..