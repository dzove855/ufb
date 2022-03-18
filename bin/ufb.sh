#!/usr/local/bin/bash

empty()         [[ -z $1 ]]
fileExist()     [[ -f $1 ]]
dirExist()      [[ -d $1 ]]
inArray(){ 
    local -n array="$1"
    empty "$2" && die "inArray need two arguments: ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
    [[ "${array[@]}" == *" $2 "* ]]
}

die(){
    printf '%s\n' "$*" >&2
    exit 2
}

# load loadable builtins
declare -a RUNTIME_LOAD
load(){
    enable -f "${BASH_LOADABLE_PATH:-/usr/local/lib/bash}/$1" "$1" &>/dev/null || return 1
    RUNTIME_LOAD+=("${BASH_LOADABLE_PATH:-/usr/local/lib/bash}/$1")
}

# declare a path of all imported class, so we can always check if an class is imported
declare -a RUNTIME_IMPORT
import(){
    local -a importPath
    local path

    # look for package file inside directory
    empty "$1" && die "Unusual use of import ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
    IFS=":" read -a importPath <<<"${IMPORT_PATH:-/usr/share/ufb}"

    for path in "${importPath}"; do
        fileExist "${path%/}/$1.shm" && {
            RUNTIME_IMPORT+=("${path%/}/$1.shm")
            source "${path%/}/$1.shm"
            return
        }
    done
    die "Import of $1 failed! ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
}

source "$1"
