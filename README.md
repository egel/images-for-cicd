# Images for CI-CD

Here is a collection of images that can be used in your CI/CD pipelines. These images are designed to provide the necessary tools for your development and testing workflows.

**Github**

```sh
podman pull egel/github-dind:latest
```

**Gitlab**

```sh
podman pull egel/gitlab-dind:latest
```

**Podman**

```sh
podman pull egel/podman:latest
```

## Build

Here is very trivial script which build the images and push to repository

```sh
# github
./scripts/build_and_push.sh for_github

# gitlab
./scripts/build_and_push.sh for_gitlab

# podman
./scripts/build_and_push.sh for_podman
```

## License

Apache License Version 2.0
