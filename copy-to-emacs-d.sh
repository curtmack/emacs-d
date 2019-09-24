#!/bin/bash

echo "Warning: This script will clobber changes in your .emacs.d directory."

read -r -p "Proceed? [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY])
        # Make sure the directory exists
        if [ ! -e $HOME/.emacs.d/ ]
        then
            mkdir $HOME/.emacs.d/
        fi

        # Try rsync for speed, if not fallback to rm -rf and replace
        if command -v rsync > /dev/null
        then
            rsync -av -f '+ init.el' -f '+ site-lisp/' -f '+ site-lisp/**' -f '+ conf.d/' -f '+ conf.d/**' -f '- **' ./ $HOME/.emacs.d/
        else
            echo "Notice: rsync not found, falling back to `rm -rf` and `cp -R`"
            for file in init.el site-lisp conf.d
            do
                rm -rf $HOME/.emacs.d/$file
                cp -R ./$file $HOME/.emacs.d/
            done
        fi
        ;;

    *)
        exit
        ;;
esac
