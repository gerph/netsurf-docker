# Build all the docker files

all: base

base:
	DOCKER_BUILDKIT=1 docker build -t gerph/netsurf:latest -f base.Dockerfile .
