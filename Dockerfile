FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

RUN apt-get update \
    && apt-get install -y git \
    && apt-get clean

RUN git clone https://github.com/PengNi/ccsmeth

WORKDIR /workspace/ccsmeth
RUN python setup.py build \
    && python setup.py install
RUN sed -i 's/from utils\.attention import Attention/from \.utils\.attention import Attention/' /opt/conda/lib/python3.8/site-packages/ccsmeth-0.1.0-py3.8.egg/ccsmeth/models.py

RUN conda install -c bioconda -y samtools