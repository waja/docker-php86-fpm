IMAGE_NAME := waja/php86-fpm

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! docker run --rm $(IMAGE_NAME) -v | grep -qE '^PHP[[:space:]]8\.6\.'; then exit 1; fi
