all: env build

env:
	docker build -t android-node-build .

build:
	rm -rf out
	mkdir -p out
	docker run -v `pwd`/out:/home/dev/out android-node-build