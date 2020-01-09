.DEFAULT_GOAL := help

##########################################################
##@ DOCS
##########################################################
.PHONY: docs-build docs-serve

build:													## Build Static site
	@hugo --gc --minify --cleanDestinationDir -t hello-friend-ng

serve:													## Serve Static site
	@hugo server -t hello-friend-ng

##########################################################
##@ UTIL
##########################################################
.PHONY: generate-deploy-key

generate-deploy-key:
	ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f gh-pages -N ""

help:													## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m 	%s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)