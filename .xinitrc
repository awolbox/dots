#!/bin/env sh
#
# ~/.xinitrc -  awolbox@crash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[ -f /etc/xprofile ] && { . /etc/xprofile; }
[ -f ~/.xprofile ] && { . ~/.xprofile; }
[ -f $sysresources ] && { xrdb -merge $sysresources; }
[ -f $sysmodmap ] && { xmodmap $sysmodmap; }
[ -f "$userresources" ] && { xrdb -merge "$userresources"; }
[ -f "$usermodmap" ] && { xmodmap "$usermodmap"; }
[ -d /etc/X11/xinit/xinitrc.d ] && 
{
	for f in /etc/X11/xinit/xinitrc.d/?*.sh
	do
		[ -x "$f" ] && . "$f"
	done
	unset f;
}
exec i3
~/.fehbg & 

