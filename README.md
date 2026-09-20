# Webgrind Docker Container Image 

[![Build Status](https://github.com/wodby/webgrind/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/webgrind/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/webgrind:1.9-X.X.X`) which correspond to [git tags](https://github.com/wodby/webgrind/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [wodby/php](https://github.com/wodby/php)
- [GitHub actions builds](https://github.com/wodby/webgrind/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/webgrind)

Supported tags and respective `Dockerfile` links:

- `1.9`, `1`, `latest`  [_(Dockerfile)_](https://github.com/wodby/webgrind/tree/master/Dockerfile)

All images built for `linux/amd64` and `linux/arm64`

## Environment Variables

| Variable                         | Default Value       | Description |
|----------------------------------|---------------------|-------------|
| `WEBGRIND_STORAGE_DIR`           |                     |             |
| `WEBGRIND_PROFILER_DIR`          | `/tmp`              |             |
| `WEBGRIND_DEFAULT_TIMEZONE`      | `Europe/Copenhagen` |             |
| `WEBGRIND_ORIG_CODEBASE_PATH`    | `/var/www/html`     |             |
| `WEBGRIND_MOUNTED_CODEBASE_PATH` | `/mnt/codebase`     |             |

See [wodby/php](https://github.com/wodby/php) for more variables

## Exposed ports

This image exposes the port 8080 for the webgrind webserver.

## Building with pinned base images

Build with the Makefile to use the base image digests in `base-images.mk`. Local
builds and CI resolve the same version and variant to the same multi-platform
image. A version without a pin fails before the build starts.

When adding a supported base version or variant, add its image index digest to
`base-images.mk`. For a custom build, override `BASE_IMAGE` with a complete
`repository:tag@sha256:...` reference.
