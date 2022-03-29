#!/usr/bin/ufb.sh

import extra/getopt

while Extra::Getopt "v|h::" arg; do
    case "$arg" in
        h)
            echo $OPTARG
        ;;
        v)
            echo huhu
        ;;
    esac
done
shift $(( OPTIND - 1 ))


echo $1
