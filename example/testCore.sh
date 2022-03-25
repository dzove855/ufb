#!/usr/bin/ufb.sh

import core/main
import core/io

declare fuu
Core::Mktemp -v fuu -d

declare -p fuu

fuu2=(a b c)


declare -A puf
Core::Io::Attr -v puf /home/dzove855/apps.csv
declare -p puf

declare -A puf2
Core::Io::Attr::stat puf2 /home/dzove855/apps.csv
declare -p puf2
