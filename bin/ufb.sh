#!/usr/local/bin/bash

.isDigit()      [[ "$1" =~ ^[0-9]+$ ]]
.matchString()  [[ "$1" == "$2" ]]
.matchRegex()   [[ "$1" =~ $2 ]]
.isEmpty()      [[ -z "$1" ]]

.inArray(){
    local -n array="$1"
    [[ -z "$2" ]] && die "inArray need two arguments: ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
    [[ "${array[@]}" == *" $2 "* ]]
}

.trim(){
    local -n var="$1"
    : "${var# }"
    : "${_% }"
    var="$_"
}

die(){
    printf '%s\n' "$*" >&2
    exit 2
}

# load loadable builtins
declare -a RUNTIME_LOAD
load(){
    .inArray RUNTIME_LOAD "${BASH_LOADABLE_PATH:-/usr/local/lib/bash}/$1" || {
        enable -f "${BASH_LOADABLE_PATH:-/usr/local/lib/bash}/$1" "$1" &>/dev/null || return 1
        RUNTIME_LOAD+=("${BASH_LOADABLE_PATH:-/usr/local/lib/bash}/$1")
    }
}

# declare a path of all imported class, so we can always check if an class is imported
declare -a RUNTIME_IMPORT
import(){
    local -a importPath
    local path

    # look for package file inside directory
    .isEmpty "$1" && die "Unusual use of import ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
    IFS=":" read -a importPath <<<"${IMPORT_PATH:-/usr/share/ufb}"

    for path in "${importPath}"; do
        [[ -f "${path%/}/$1.shm" ]] && {
            .inArray RUNTIME_IMPORT "${path%/}/$1.shm" || {
                RUNTIME_IMPORT+=("${path%/}/$1.shm")
                source "${path%/}/$1.shm"
            }
            return
        }
    done
    die "Import of $1 failed! ${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
}

source "$1"
