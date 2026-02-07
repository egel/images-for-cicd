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
    git \
    make \
    cmake \
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
