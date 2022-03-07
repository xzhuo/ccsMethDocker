FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

RUN apt-get update \
    && apt-get install -y git \
    && apt-get clean

RUN git clone https://github.com/PengNi/ccsmeth

WORKDIR /workspace/ccsmeth
RUN python setup.py build \
    && python setup.py install