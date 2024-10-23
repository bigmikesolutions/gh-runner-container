
.PHONY: build
build:
	@docker buildx build \
		--platform linux/x86_64 \
		-t gh-runner .

.PHONY: start
start:
	@docker run \
              --detach \
              --platform linux/x86_64 \
              --env ORGANIZATION=${GH_ORG} \
              --env ACCESS_TOKEN=${GH_ACCESS_TOKEN} \
              --name gh-runner \
              gh-runner

.PHONY: logs
logs:
	@docker logs gh-runner