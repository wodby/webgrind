# Webgrind Docker Container Image 

[![Build Status](https://github.com/wodby/webgrind/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/webgrind/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)

## Docker Images

Use image revision tags such as `wodby/webgrind:1.9-rN` to select a Wodby image revision.
The `rN` suffix identifies the image revision separately from the upstream software version.
See [release tags](https://github.com/wodby/webgrind/tags) for available revisions and the [image revision policy](https://github.com/wodby/images#image-revisions) for upgrade guidance.
Existing SemVer image tags remain available.

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
