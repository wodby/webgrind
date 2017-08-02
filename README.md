# Webgrind Docker Container Image 

[![Build Status](https://travis-ci.org/wodby/webgrind.svg?branch=master)](https://travis-ci.org/wodby/webgrind)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/webgrind.svg)](https://hub.docker.com/r/wodby/webgrind)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

Images are based on [wodby/php](https://github.com/wodby/php), built via [Travis CI](https://travis-ci.org/wodby/webgrind) and published on [Docker Hub](https://hub.docker.com/r/wodby/webgrind). 

## Versions

| Webgrind | PHP                                 | Alpine Linux |
| -------- | ----------------------------------- | ------------ |
| 1.5      | [7.1](https://github.com/wodby/php) | 3.6          |

See [wodby/php](https://github.com/wodby/php#versions) for exact PHP version

## Environment Variables

| Variable                  | Default Value     | Description |
| ------------------------- | ----------------- | ----------- |
| WEBGRIND_STORAGE_DIR      |                   |             |
| WEBGRIND_PROFILER_DIR     | /tmp              |             |
| WEBGRIND_DEFAULT_TIMEZONE | Europe/Copenhagen |             |

See [wodby/php](https://github.com/wodby/php) for more variables
