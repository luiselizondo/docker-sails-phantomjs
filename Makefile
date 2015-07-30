CURRENT_DIRECTORY := $(shell pwd)

build:
	@docker build --tag=luis/sails-phantomjs $(CURRENT_DIRECTORY)

build-no-cache:
	@docker build --no-cache --tag=luis/sails-phantomjs $(CURRENT_DIRECTORY)

.PHONY: build build-no-cache