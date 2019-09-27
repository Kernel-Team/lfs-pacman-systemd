pathappend /usr/lib/pkgconfig PKG_CONFIG_PATH
if [ -d /usr/local/lib/pkgconfig ] ; then
        pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/local/lib64/pkgconfig ] ; then
        pathappend /usr/local/lib64/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/lib64/pkgconfig ] ; then
        pathappend /usr/lib64/pkgconfig PKG_CONFIG_PATH
fi

if [ -d /usr/local/bin ]; then
        pathprepend /usr/local/bin
fi
if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
        pathprepend /usr/local/sbin
fi

# Set some defaults before other applications add to these paths.
pathappend /usr/share/man  MANPATH
pathappend /usr/share/info INFOPATH

# opt
if [ -d /opt/bin ]; then
        pathappend /opt/bin
fi
if [ -d /opt/info ]; then
        pathappend /opt/info INFOPATH
fi
if [ -d /opt/man ]; then
        pathappend /opt/man MANPATH
fi
if [ -d /opt/lib/pkgconfig ]; then
        pathappend /opt/lib/pkgconfig PKG_CONFIG_PATH
fi

# aclocal path
pathappend /usr/share/aclocal ACLOCAL_PATH

if [ -d /usr/local/share/aclocal ]; then
        pathappend /usr/local/share/aclocal ACLOCAL_PATH
fi
