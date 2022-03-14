.DEFAULT_GOAL:=help
SHELL:=/bin/bash
modules := $(ls -d */)

##@ Dependencies

.PHONY: deps

deps: ## Check dependancies
	$(info Check dependancies)
	echo ${modules}


##@ Install

.PHONY: install

install: deps ## Installs modules
	$(info Installs given modules)


##@ Build

.PHONY: build

build: deps ## Loads modules
	$(info Loads config files for all installed modules)

##@ Cleanup

.PHONY: clean

clean: ## Uninstall modules
	$(info Removes all modules)

##@ Helpers

.PHONY: list
list: ## List all modules
	$(info Lists all installed modules)


.PHONY: help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)