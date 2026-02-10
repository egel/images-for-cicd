# Source: https://github.com/containers/image_build/blob/7586f40841d68018fa373fd9e6cba11ff867f93a/podman/
FROM quay.io/podman/stable:latest AS base
FROM base

# Switch to root to install packages
USER root

# Install essential system packages
# RUN add-apt-repository universe 
RUN dnf update
RUN dnf upgrade
RUN dnf -y install \
    # Core utilities
    curl \
    wget \
    unzip \
    zip \
    tar \
    gzip \
    p7zip \
    p7zip-plugins \
    # Build tools
    task \ 
    make \
    cmake \
    # Support
    bash \
    git \
    gcc \
    ca-certificates \
    gnupg \
    jq \
    tree \
    rsync \
    neovim \
    openssh \
    openssh-clients
RUN dnf clean all

# Switch back to original user
USER podman
