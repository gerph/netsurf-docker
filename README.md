# Netsurf in docker with VNC server

## Introduction

This repository contains the docker build commands for the Docker hub
repositories:

* https://hub.docker.com/r/gerph/netsurf

These docker images contain:

* An Ubuntu 21.04 OS.
* A VNC server.
* An installation of NetSurf.

## Building

To build these images locally:

```
make
```

## Usage

To use the images:

```
docker run -it --rm -p 5901:5901 gerph/netsurf
```

Then use a VNC client to connect to VNC on localhost port 1 (which might
be specified as :1 or :5901 depending on your client). A password is
required, which is configured to be `password`.

Closing NetSurf will terminate the docker container.

To access a current directory from within the container, start the docker process with a volume mapping, thus:

```
docker run -it -v $PWD:/home/netsurf/work --rm -p 5901:5901 gerph/netsurf
```

This shares your current working directory in the directory `work` in the home directory of the netsurf user.
