# Webgrind Docker Container Image 

[![Build Status](https://github.com/wodby/webgrind/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/webgrind/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/webgrind.svg)](https://microbadger.com/images/wodby/webgrind)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/webgrind:1.7-X.X.X`) which correspond to [git tags](https://github.com/wodby/webgrind/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [wodby/php](https://github.com/wodby/php)
- [GitHub actions builds](https://github.com/wodby/webgrind/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/webgrind)

Supported tags and respective `Dockerfile` links:

- `1.7`, `1`, `latest`  [_(Dockerfile)_](https://github.com/wodby/webgrind/tree/master/Dockerfile)

## Environment Variables

| Variable                    | Default Value       | Description |
| --------------------------- | ------------------- | ----------- |
| `WEBGRIND_STORAGE_DIR`      |                     |             |
| `WEBGRIND_PROFILER_DIR`     | `/tmp`              |             |
| `WEBGRIND_DEFAULT_TIMEZONE` | `Europe/Copenhagen` |             |

See [wodby/php](https://github.com/wodby/php) for more variables
