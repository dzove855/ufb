#!/usr/bin/ufb.sh

import core/main

declare fuu
Core::Mktemp -v fuu -d

declare -p fuu

fuu2=(a b c)
inArray fuu2 
