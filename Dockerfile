FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc make cmake libcgal-dev libboost-all-dev python3-dev build-essential \
    && apt-get clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN pip install shapely svgelements

WORKDIR /packaide
COPY . .
RUN mkdir build
WORKDIR /packaide/build
RUN cmake ..
RUN make
RUN make install

WORKDIR /
