# Source: https://hub.docker.com/_/docker
FROM docker:dind AS base
FROM base

# Get list of packages: https://pkgs.alpinelinux.org/packages
RUN apk add --update --no-cache \
      bash \
      curl \
      gcc \
      git \
      jq \
      libffi-dev \
      make \
      musl-dev \
      openssl-dev \
      python3-dev \
      py3-pip \
      py3-cryptography \
      py3-setuptools \
      #py3-dockercompose \
      rsync
