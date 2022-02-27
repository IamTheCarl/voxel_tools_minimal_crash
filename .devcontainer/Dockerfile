# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.217.4/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use hirsuite or bionic on local arm64/Apple Silicon): hirsute, focal, bionic
ARG VARIANT="hirsute"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# Get dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -yq --no-install-recommends install build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
    libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev mingw-w64 \
    apache2 libclang-dev libclang-6.0-dev clang-6.0 curl libssl-dev gdb kmod

RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix \
    && update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix

# Install Wine.
RUN apt-get update && apt-get -yq install --no-install-recommends software-properties-common
RUN dpkg --add-architecture i386
RUN wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
RUN add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ focal main"
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -yq --no-install-recommends install \
        winehq-stable

ENV GODOT_BUILD_DIR=/tmp/godot_build_directory
ENV PATH=${PATH}:${GODOT_BUILD_DIR}/bin/