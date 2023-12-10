ARG GCC_VERSION
FROM gcc:${GCC_VERSION}

WORKDIR /root
COPY common/install-cmake.sh common/install-mold.sh common/install-ninja.sh ./

RUN chmod +x install-cmake.sh install-mold.sh install-ninja.sh
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ccache python3 python3-pip pipx git && \
    apt-get clean all && \
    ./install-cmake.sh && \
    ./install-mold.sh && \
    CXX=g++ ./install-ninja.sh && \
    rm install-cmake.sh install-mold.sh install-ninja.sh && \
    rm -rf /var/lib/apt/lists/* && \
    pipx ensurepath && \
    pipx install conan

ENV CC gcc
ENV CXX g++
ENV CONAN_CMAKE_GENERATOR Ninja