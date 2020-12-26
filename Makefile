VER=0.3

build:
	docker build . -t debmatic:latest -t debmatic:${VER} -t t20:5000/debmatic:latest -t t20:5000/debmatic:${VER}

run:
	docker run --rm -it debmatic:latest bash
