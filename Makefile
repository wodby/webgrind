-include env_make

WEBGRIND_VER ?= 1.9.4
TAG ?= $(WEBGRIND_VER)

REPO = wodby/webgrind
NAME = webgrind-$(WEBGRIND_VER)

PLATFORM ?= linux/amd64

PHP_VER ?= 8.2
BASE_IMAGE_TAG = $(PHP_VER)

ifneq ($(STABILITY_TAG),)
    ifneq ($(TAG),latest)
        override TAG := $(TAG)-$(STABILITY_TAG)
    endif
endif

.PHONY: build buildx-build buildx-build-amd64 buildx-push test push shell run start stop logs clean release

# Resolve the same pinned base image for every local and CI build target.
include base-images.mk

default: build

build:
	docker build --build-arg BASE_IMAGE="$(BASE_IMAGE)" -t $(REPO):$(TAG) \
		--build-arg WEBGRIND_VER=$(WEBGRIND_VER) \
		./

# --load doesn't work with multiple platforms https://github.com/docker/buildx/issues/59
# we need to save cache to run tests first.
buildx-build-amd64:
	docker buildx build --build-arg BASE_IMAGE="$(BASE_IMAGE)" \
		--platform linux/amd64 \
		--build-arg WEBGRIND_VER=$(WEBGRIND_VER) \
		--load \
		-t $(REPO):$(TAG) \
		./

buildx-build:
	docker buildx build --build-arg BASE_IMAGE="$(BASE_IMAGE)" \
		--platform $(PLATFORM) \
		--build-arg WEBGRIND_VER=$(WEBGRIND_VER) \
		-t $(REPO):$(TAG) ./

buildx-push:
	docker buildx build --build-arg BASE_IMAGE="$(BASE_IMAGE)" --push \
		--platform $(PLATFORM) \
		--build-arg WEBGRIND_VER=$(WEBGRIND_VER) \
		-t $(REPO):$(TAG) ./

test:
	cd ./tests && IMAGE=$(REPO):$(TAG) NAME=$(NAME) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
