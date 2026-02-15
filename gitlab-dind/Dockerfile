# Source: https://hub.docker.com/_/docker
FROM docker:dind AS base
FROM base

# Get list of packages: https://pkgs.alpinelinux.org/packages
RUN apk add --update \
      # Core utilities
      curl \
      wget \
      unzip \
      zip \
      tar \
      gzip \
      7zip \
      # Build tools
      alpine-sdk \
      task \
      make \
      cmake \
      # Support
      bash \
      gcc \
      git \
      jq \
      tree \
      rsync \
      neovim \
      libffi-dev \
      musl-dev \
      openssl-dev \
      python3-dev \
      py3-pip \
      py3-cryptography \
      py3-setuptools
      # newer docker:dind already has docker with docker-compose within
