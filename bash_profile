# Bash profile, invoked for login shells.

# include .bashrc if it exists
if [[ -f ~/.bashrc ]] ; then
    source ~/.bashrc
fi

export USER=netsurf
export DISPLAY=:1
vncserver -geometry 1280x1024 -localhost no 2> /dev/null >/dev/null || echo "VNC server failed to startup"
