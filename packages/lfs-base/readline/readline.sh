# Beyond Linux® From Scratch (systemd edition) - Version 2018-06-11
# Chapter 3. After LFS Configuration Issues
# http://www.linuxfromscratch.org/blfs/view/systemd/postlfs/profile.html
# Setup the INPUTRC environment variable.
if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ] ; then
        INPUTRC=/etc/inputrc
fi
export INPUTRC
