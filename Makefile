.DEFAULT_GOAL := help

IMAGE := tg-non-zero-error-repro

help:
	@echo "Usage: make [option]"
	@echo ""
	@echo "  build    build the container image"
	@echo "  shell    shell into the container image"
	@echo ""
.PHONY: help

build:
	docker build -t $(IMAGE) .
.PHONY: build

shell:
	docker run -it \
		-v ./tf:/opt/tf \
		--entrypoint /bin/bash \
		$(IMAGE)
.PHONY: shell
