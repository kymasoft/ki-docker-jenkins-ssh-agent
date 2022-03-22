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
		--tag 64gag/ki-jenkins-ssh-agent \
		.

.PHONY: clean
clean:
	-docker image rm 64gag/ki-jenkins-ssh-agent

.PHONY: push
push: build
	docker push 64gag/ki-jenkins-ssh-agent:latest
