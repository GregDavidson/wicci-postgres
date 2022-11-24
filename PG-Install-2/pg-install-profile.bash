#!/usr/bin/bash

# * Example pg-install Profile

# Happens to be mine! --jgd

# ** Declare Superusers

# create these user accounts as PostgreSQL Superusers
# - not required, just convenient if they're developers
declare -ga PG_Superusers=(
    greg
)

# ** Locations of Wicci Resources

# add this to the postgresql.conf dynamic_library_path
declare -g PG_Wicci_Library=/home/greg/Projects/Wicci/Make/wicci1

# add a symbolic link from $PG_Data/XFiles to this directory
declare -g PG_Wicci_XFiles=/home/greg/Projects/Wicci/XFiles

# ** Try to find and add tcl

# The =tcl= language is one of the most flexible and performant scripting
# languages, probably the next best thing to writing your server-side code in C.
# It's not required for the Wicci, but some of the current Wicci developers are
# used it having it available.

do_try_find_tcl() {
    local tcl this=do_try_find_tcl
    for tcl in /usr/{lib,lib64}{,/tcl*}/tclConfig.sh
    do
        [ -f "$tcl" ] && break
    done
    if [ -f "${tcl:-}" ]; then
        with_tcl="--with-tclconfig=${tcl%/*}"
    else
        with_tcl=''
        report -warning "`cr 26 407 $this`" \
               "Can't find tcl, will proceed without it!!"
    fi
}

do_try_find_tcl

Config_Options+=(
    $with_tcl                   # don't quote this!
)
