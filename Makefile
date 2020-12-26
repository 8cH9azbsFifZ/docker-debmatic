VER=0.1

build:
	docker build . -t debmatic:latest -t debmatic:${VER}
