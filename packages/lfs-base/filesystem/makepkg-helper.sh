#!/bin/sh
# makepkg helper functions
# <alexforsale@yahoo.com>

# add_to_repo function
function add_to_repo(){
    if [ ! $(command -v pacman) ];then
        echo "pacman not installed!"
        return 1
    fi

    # determine pacman location
    case $(dirname $(command -v pacman)| sed 's/bin//g') in
        "/usr/local/")
            pacpath="/usr/local"
            ;;
        "/usr/")
            pacpath="/"
            ;;
        "/tools/")
            # this is my default
            pacpath="/usr/local"
            ;;
    esac

    [ -f $pacpath/etc/makepkg.conf ] &&
        . $pacpath/etc/makepkg.conf
    [ -f ~/.config/pacman/makepkg.conf ] && . ~/.config/pacman/makepkg.conf

    function err(){
        echo "$FUNCNAME tarball repo -- simple program add compiled program from makepkg to pacman repository

where:
    tarball : path and filename or compiled packaged
    repo    : name of pacman repo(refer to pacman.conf for the names)"

        return 1
    }

    if [ -z $2 ];then
        err;
    else
        tarball="$(basename $1)"
        repo=`cat $pacpath/etc/pacman.conf | awk "/\/${2}/" | sed 's/Server = file:\/\///g'`

        if [ -n $repo ] && [ -d $repo ];then
            if [ -f $1 ];then
                echo "moving $1 to $repo dir"
                mv -v $1 $repo
                pushd $repo
                repo-add ${2}.db.tar.?z $tarball
                popd
            else
                err;
            fi
        else
            err;
        fi
    fi
}
