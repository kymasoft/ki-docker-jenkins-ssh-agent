all: help

.PHONY: help
help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build            - build all images"
	@echo "   2. make clean            - remove all images"
	@echo ""

.PHONY: build
build:
	docker image build \
		--file Dockerfile \
		--tag kymasoft/ki-jenkins-ssh-agent \
		.

.PHONY: clean
clean:
	-docker image rm kymasoft/ki-jenkins-ssh-agent

.PHONY: push
push: build
	docker image push kymasoft/ki-jenkins-ssh-agent:latest
