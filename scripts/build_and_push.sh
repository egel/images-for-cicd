#!/bin/bash

DOCKERHUB_GITHUB_BASEURL=egel/github-dind
DOCKERHUB_GITHUB_LATEST=${DOCKERHUB_GITHUB_BASEURL}:latest

DOCKERHUB_GITLAB_BASEURL=egel/gitlab-dind
DOCKERHUB_GITLAB_LATEST=${DOCKERHUB_GITLAB_BASEURL}:latest

DOCKERHUB_PODMAN_BASEURL=egel/podman
DOCKERHUB_PODMAN_LATEST=${DOCKERHUB_PODMAN_BASEURL}:latest

function build_image() {
  local directory=$1
  local image_name=$2

  local pod="$(podman manifest exists ${image_name})"

  echo "This is: $pod"

  echo "Begin process to build images for GitHub"
  if [[ "$(podman manifest exists ${image_name})" -eq 1 ]]; then
    echo "Image manifest does not exist. Creating image manifest..."
    podman manifest create ${image_name}
  else
    echo "Image manifest already exists. Skipping manifest creation..." || {
      echo "Error creating image manifest!" >&2 # send err to stderr
      exit 1
    }
  fi

  echo ""
  echo "Start building images..."
  podman build \
    --no-cache \
    --platform linux/amd64,linux/arm64 \
    --file ${directory}/Dockerfile \
    --manifest ${image_name}

  echo ""
  echo "Start pushing images..."
  podman manifest push ${image_name}

  echo ""
  echo "Build and push process completed."
}

function main() {
  case "$1" in
  for_gitlab)
    build_image "gitlab-dind" "${DOCKERHUB_GITLAB_LATEST}"
    ;;
  for_github)
    build_image "github-dind" "${DOCKERHUB_GITHUB_LATEST}"
    ;;
  for_podman)
    build_image "podman" "${DOCKERHUB_PODMAN_LATEST}"
    ;;
  clean)
    podman manifest rm ${DOCKERHUB_GITLAB_LATEST}
    podman manifest rm ${DOCKERHUB_GITHUB_LATEST}
    podman manifest rm ${DOCKERHUB_PODMAN_LATEST}
    ;;
  *)
    echo "Usage: for_gitlab, for_github, for_podman, clean"
    exit 1
    ;;
  esac
}

main "$@"
