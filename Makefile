DOCKERHUB_PODMAN_BASEURL=egel/podman
DOCKERHUB_PODMAN_LATEST=${DOCKERHUB_PODMAN_BASEURL}:latest

DOCKERHUB_GITHUB_BASEURL=egel/github-dind
DOCKERHUB_GITHUB_LATEST=${DOCKERHUB_GITHUB_BASEURL}:latest

DOCKERHUB_GITLAB_BASEURL=egel/gitlab-dind
DOCKERHUB_GITLAB_LATEST=${DOCKERHUB_GITLAB_BASEURL}:latest


.PHONY: build_and_push_image_podman
build_and_push_image_podman:
	podman manifest create ${DOCKERHUB_PODMAN_LATEST}
	podman build --platform linux/amd64,linux/arm64 --file podman/Dockerfile --manifest ${DOCKERHUB_PODMAN_LATEST}
	podman manifest push ${DOCKERHUB_PODMAN_LATEST}
# 	podman rm ${DOCKERHUB_PODMAN_LATEST}

.PHONY: build_and_push_image_github
build_and_push_image_github:
	podman manifest create ${DOCKERHUB_GITHUB_LATEST}
	podman build --platform linux/amd64,linux/arm64 --file github-dind/Dockerfile --manifest ${DOCKERHUB_GITHUB_LATEST}
	podman manifest push ${DOCKERHUB_GITHUB_LATEST}
# 	podman rm ${DOCKERHUB_GITHUB_LATEST}

.PHONY: build_and_push_image_gitlab
build_and_push_image_gitlab:
	podman manifest create ${DOCKERHUB_GITLAB_LATEST}
	podman build --platform linux/amd64,linux/arm64 --file gitlab-dind/Dockerfile --manifest ${DOCKERHUB_GITLAB_LATEST}
	podman manifest push ${DOCKERHUB_GITLAB_LATEST}
# 	podman rm ${DOCKERHUB_GITLAB_LATEST}

.PHONY: build_and_push_all
build_and_push_all: build_and_push_image_podman build_and_push_image_github build_and_push_image_gitlab

clean:
	podman rm ${DOCKERHUB_PODMAN_LATEST}
	podman rm ${DOCKERHUB_GITHUB_LATEST}
	podman rm ${DOCKERHUB_GITLAB_LATEST}