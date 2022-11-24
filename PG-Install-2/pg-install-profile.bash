#!/usr/bin/bash

# * Example pg-install Profile

# Happens to be mine! --jgd

# ** Declare Superusers

# create these user accounts as PostgreSQL Superusers
# - not required, just convenient if they're developers
declare -ga PG_Superusers=(
    greg
)

declare -ga PG_Databases=(
    wicci1
)

# ** Locations of Wicci Resources

# add this to the postgresql.conf dynamic_library_path
declare -g PG_Wicci_Library=/home/greg/Projects/Wicci/Make/wicci1

# add a symbolic link from $PG_Data/XFiles to this directory
declare -g PG_Wicci_XFiles=/home/greg/Projects/Wicci/XFiles

# ** Try to find and add tcl

# The =tcl= language is one of the most flexible and performant scripting
# languages, the next best thing to writing your server-side code in C.
# It's not required for the Wicci, and some of the current Wicci developers
# (Lynn and Greg) are used to having it available.  What server-side
# languages would YOU like to have in in your custom PostgreSQL?

find_tcl_maybe() {
    local tcl this=do_try_find_tcl
    for tcl in /usr/{lib,lib64}{,/tcl*}/tclConfig.sh
    do
        [ -f "$tcl" ] && break
    done
    [ -f "${tcl:-}" ] || {
        with_tcl=''
        report -warning "`cr 26 407 $this`" \
               "Can't find tcl, will proceed without it!!"
        return 1
    }
    with_tcl="--with-tclconfig=${tcl%/*}"
    return 0
}

declare -ga Config_Options

! find_tcl_maybe || {
    declare -ga PG_Langs=(
        pltcl
    )
    Config_Options+=(
        $with_tcl                   # don't quote this!
    )
}
