#!/bin/sh

usage="Usage: $0 [-s] [-l language] [-u user] [-c] [ -C copy_command ] [ -p pastebin_url ] file\n
-s: toggles silent mode (do not print the final URL)\n
-c: copies the final URL to clipboard"

if [ "$#" -lt 1 ] ; then
    echo -e $usage;
    exit
fi

pastebin_url="http://paste.awesom.eu"
user=""
copy=""
lang=""
print="yes"

which xclip > /dev/null
if [ "$?" -eq 0 ] ; then
    copy_cmd="$(which xclip) -i"
else
    which xsel > /dev/null
    if [ "$?" -eq 0 ] ; then
        copy_cmd="$(which xsel)"
    fi
fi

while getopts  :l:u:csC:p: option
do
    case "$option" in
        l) language="$OPTARG";;

        u) user="$OPTARG";;

        c) copy="yes";;

        s) print="";;

        C) copy_command="$OPTARG";;

        p) pastebin_url="$OPTARG";;


        ?) echo -e $usage;
           exit;;
    esac
done

shift $(($OPTIND - 1))
file=$1

if [ ! "$language" ] ; then
    ext="$(echo \"$file\"|sed -e 's/.*\.//')"
fi

paste=$(curl -d "hl=${language}&ext=${ext}&user=${user}&escape=on&script" --data-urlencode "paste@${file}" "$pastebin_url" 2>/dev/null)

final="$pastebin_url/$paste"
if [ "$print" = "yes" ] ; then
    echo "$final"
fi

if [ "$copy" = "yes" -a -n "$copy_command" ] ; then
    echo "$final" | $copy_command
fi
