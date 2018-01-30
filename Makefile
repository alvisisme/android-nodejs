all: env build

env:
	docker build -t android-node-build .

build:
	docker run -v `pwd`:/home/dev/out android-node-build