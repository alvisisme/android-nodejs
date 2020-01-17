all: env build

env:
	docker-compose build

build:
	docker-compose run -it android-build-nodejs

dist:
	rm -rf dist/*
	cp build/node-executable/out/Release/node dist/node
	cp build/node-shared-lib/out/Release/lib.target/libnode.so.48 dist/libnode.so.48
	cp -r build/node-shared-lib/include dist/

.PHONY: env build dist