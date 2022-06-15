ARG DEBIAN_VERSION
FROM bitnami/minideb:${DEBIAN_VERSION}

WORKDIR /root
COPY common/install-cmake.sh common/install-mold.sh clang/install-clang.sh ./

ARG DEBIAN_VERSION
ARG LLVM_VERSION
RUN chmod +x install-cmake.sh install-mold.sh install-clang.sh && \ 
    apt-get update -qq && \
    apt-get install -y --no-install-recommends ca-certificates wget gnupg ninja-build python3 python3-pip ccache && \
    ./install-clang.sh "${DEBIAN_VERSION}" "${LLVM_VERSION}" && \
    ./install-cmake.sh && \
    ./install-mold.sh && \
    rm install-cmake.sh install-mold.sh install-clang.sh && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install conan

ENV CC clang-${LLVM_VERSION}
ENV CXX clang++-${LLVM_VERSION}
ENV CONAN_CMAKE_GENERATOR Ninja