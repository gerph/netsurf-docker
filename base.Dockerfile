FROM ubuntu:21.04

#ARG rpcemu_version=0.9.3

# Add user we're going to run under (without a password)
RUN adduser netsurf && \
    mkdir -p /home/netsurf && \
    chown -R netsurf:netsurf /home/netsurf

# Install the VNC server, with the build system and libraries.
# The password for the VNC server is 'password'.
USER root
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive"  apt-get install -y tigervnc-standalone-server fluxbox locales \
                        build-essential \
                        wget unzip rsync \
                     && \
    locale-gen en_US.UTF-8 && \
    mkdir -p /home/netsurf/.vnc && \
    echo "29g8/XJ6FFg=" | base64 -d > /home/netsurf/.vnc/passwd && \
    chown -R netsurf:netsurf /home/netsurf/.vnc && \
    chmod 0600 /home/netsurf/.vnc/passwd && \
    echo rm -rf ~/.cache/pip /var/lib/apt/lists


# Install NetSurf
WORKDIR /home/netsurf
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y netsurf-gtk
USER netsurf

ADD --chown=netsurf:netsurf bash_profile /home/netsurf/.bash_profile

CMD export DISPLAY=:1 USER=netsurf && vncserver -geometry 1280x1024 -localhost no >/dev/null 2>/dev/null && netsurf-gtk
EXPOSE 5901
