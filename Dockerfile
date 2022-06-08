FROM debian:buster-slim as builder

RUN apt-get update && \
    apt-get install -y g++ make cmake && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /libbw64

COPY . .

RUN rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_CXX_COMPILER=g++ .. && \
    make && \
    make install && \
    cd ..

ENTRYPOINT []
CMD /libbw64/build/examples/bw64_read_write @@
