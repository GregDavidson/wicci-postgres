#!/usr/bin/bash

# * Example pg-install Profile

# Happens to be mine! --jgd

# ** Declare Superusers

declare -ga Pgsql_Superusers=(
    greg
)

# ** Try to find and add tcl

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
        report -warning "`cr 26 407 $this`" "Can't find tcl, will proceed without it!!"
    fi
}

do_try_find_tcl

Config_Options+=(
    $with_tcl                   # don't quote!
)
