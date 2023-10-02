#!/usr/bin/gmake -f
SHELL := /bin/bash
NODEJS = $(shell which node)
NPX = $(shell which npx)
NPM = $(shell which npm)
POSTCSSCMD = postcss

# Enforce -j1 because otherwise grunt will run multiple times. grunt does its
# own parallelism.
MFLAGS += -j1

.PHONY: all
all: build

.PHONY: check-env
check-env:
	[[ -x $(NODEJS) ]] || (echo "nodejs not found, please install nodejs" && exit 1)
	[[ -x $(NPM) ]] || (echo "npm not found, please install npm" && exit 1)
	[[ -x $(NPX) ]] || (echo "npx not found, please install npx" && exit 1)

.PHONY: install-node-modules
HAS_POSTCSS=$(shell readlink -f "$(shell npx which $(POSTCSSCMD))" 2>/dev/null)
install-node-modules:
	$(MAKE) check-env
	[[ -n $(HAS_POSTCSS) ]] || \
		( \
		echo "Running $(NPM) install..." 1>&2 && \
		$(NPM) install \
		) && \
			true

%.css: %.shim.css
	$(MAKE) $(MFLAGS) install-node-modules
	npx postcss $< > $@

build: foundation/css/default.css
