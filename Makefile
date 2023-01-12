.PHONY: all
all: foundation/css/default.css

%.css: %.shim.css
	npx postcss $< > $@
