FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version.miniconda="=4.5.1"

ENV MINICONDA_VERSION 4.5.1

ENV LC_ALL en_US.utf-8
ENV PATH="/opt/conda/bin:${PATH}"

RUN yum group install -y "Development Tools" \
    && cd /tmp \
    && curl -O https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh \
    && bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /opt/conda \
    && rm -rf Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc

ENTRYPOINT [ "/bin/bash" ]
