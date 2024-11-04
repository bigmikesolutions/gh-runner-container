REGISTRY ?= "mwrona/"
IMAGE_NAME ?= gh-runner
PLATFORMS ?= linux/x86_64
VERSION ?= "0.0.2"
DEV_VERSION ?= "dev1"

.PHONY: build
build:
	@docker buildx build \
		--platform ${PLATFORMS} \
		-t ${REGISTRY}${IMAGE_NAME}:latest \
		-t ${REGISTRY}${IMAGE_NAME}:${VERSION} \
		.

.PHONY: push
push:
	@docker push ${REGISTRY}${IMAGE_NAME}:latest
	@docker push ${REGISTRY}${IMAGE_NAME}:${VERSION}

.PHONY: push-dev
push-dev:
	@docker push ${REGISTRY}${IMAGE_NAME}:${VERSION}-${DEV_VERSION}

.PHONY: start
start:
	@docker run \
              --detach \
              --platform ${PLATFORMS} \
              --env ORGANIZATION=${GH_ORG} \
              --env ACCESS_TOKEN=${GH_ACCESS_TOKEN} \
              --name ${IMAGE_NAME} \
              ${REGISTRY}${IMAGE_NAME}

.PHONY: logs
logs:
	@docker logs ${IMAGE_NAME}