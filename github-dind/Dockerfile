# Source: 
FROM ghcr.io/actions/actions-runner:latest AS base
FROM base

# Switch to root to install packages
USER root

# Install essential system packages
RUN add-apt-repository universe && apt-get update && apt-get install -y \
    # Core utilities
    curl \
    wget \
    unzip \
    zip \
    tar \
    gzip \
    git \
    p7zip \
    p7zip-plugins \
    # Build tools
    build-essential \
    task \
    make \
    cmake \
    gcc \
    # Support
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    jq \
    tree \
    rsync \
    neovim \
    openssh-client
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to runner user
USER runner
