ARG GCC_VERSION
FROM gcc:${GCC_VERSION}
WORKDIR /root
COPY common/install-cmake.sh common/install-mold.sh ./
RUN chmod +x install-cmake.sh install-mold.sh
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ccache python3 ninja-build python3-pip && \
    apt-get clean all && \
    ./install-cmake.sh && \
    ./install-mold.sh && \
    rm install-cmake.sh install-mold.sh && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install conan

ENV CMAKE_GENERATOR Ninja
ENV CMAKE_LINKER mold