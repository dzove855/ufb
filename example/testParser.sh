#!/usr/bin/ufb.sh

import parser/ini

ini="
fuu=hehe ha
lek=muk

[section1]
fuu2=muhaha
trak=[123]
"
declare -A testing
Parser::Ini -v testing "$ini"
declare -p testing

