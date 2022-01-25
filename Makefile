IMAGE_REGISTRY=joelazar
IMAGE_NAME=wtfd
IMAGE_TAG=latest

.PHONY: all
all: build

.PHONY: build
build:
	docker build . --file Dockerfile --tag ${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

.PHONY: push
push:
	docker login --username ${IMAGE_REGISTRY}
	docker push ${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
