FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y --no-install-recommends curl gnupg software-properties-common \
    && curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - \
    && apt-add-repository "deb http://apt.llvm.org/`lsb_release -c | cut -f2`/ llvm-toolchain-`lsb_release -c | cut -f2`-19 main" \
    && apt-get install -y --no-install-recommends autoconf cmake ninja-build gcc g++ linux-tools-common linux-tools-generic libtool llvm-19-dev lld-19 clang-19 libomp-19-dev libopenmpi-dev openmpi-bin git make imagemagick ffmpeg \
    && apt-get autoremove -y --purge \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-19 10 --slave /usr/bin/clang++ clang++ /usr/bin/clang++-19 \
    && update-alternatives --install /usr/bin/opt opt /usr/bin/opt-19 10 \
    && update-alternatives --install /usr/bin/lld lld /usr/bin/lld-19 10 \
    && update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-19 10

RUN ln -s /usr/bin/convert /usr/bin/magick

ENV DEBIAN_FRONTEND=
