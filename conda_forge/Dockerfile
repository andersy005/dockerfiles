FROM condaforge/linux-anvil
RUN sudo -n yum install -y openssh-clients
COPY . /tmp/repo
RUN export PATH="/opt/conda/bin:${PATH}" && \
    conda config --add channels conda-forge 
RUN export PATH="/opt/conda/bin:${PATH}"
