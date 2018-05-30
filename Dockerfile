FROM ubuntu:17.10
MAINTAINER Dong Meng <mengdong0427@gmail.com> 

# Install build-essential, git, wget and other dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libfreetype6-dev \
    libopenblas-dev \
    libopencv-dev \
    liblapack-dev \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-numpy \
    graphviz \
    python-setuptools \
    wget \
    screen \
    rsync \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

COPY requirements.txt /tmp/.
WORKDIR /tmp
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 6006 8888

WORKDIR "/root"
CMD ["/bin/bash"]
