ARG DEBIAN_VERSION
FROM bitnami/minideb:${DEBIAN_VERSION}

WORKDIR /root
COPY common/install-cmake.sh common/install-mold.sh common/install-ninja.sh clang/install-clang.sh ./

ARG DEBIAN_VERSION
ARG LLVM_VERSION
RUN chmod +x install-cmake.sh install-mold.sh install-clang.sh install-ninja.sh && \ 
    apt-get update -qq && \
    apt-get install -y --no-install-recommends ca-certificates wget gnupg python3 python3-pip pipx ccache git && \
    ./install-clang.sh "${DEBIAN_VERSION}" "${LLVM_VERSION}" && \
    ./install-cmake.sh && \
    ./install-mold.sh && \
    CXX=clang++-17 ./install-ninja.sh && \
    rm install-cmake.sh install-mold.sh install-clang.sh install-ninja.sh && \
    rm -rf /var/lib/apt/lists/* && \
    pipx ensurepath && \
    pipx install conan

ENV CC clang-${LLVM_VERSION}
ENV CXX clang++-${LLVM_VERSION}
ENV CONAN_CMAKE_GENERATOR Ninja