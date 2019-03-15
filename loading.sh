#!/bin/bash

# author:sing
# loading效果

loading(){
    echo "loading">/tmp/load.tmp
    i=0
    index=0
    arr=( "|" "/" "-" "\\" )
    while [ $i -ge 0 ]
    do
        let index=index%4
        printf "...[%s]\r" "${arr[$index]}"
        let i++
        let index++
        sleep 0.05
        load=`cat /tmp/load.tmp`
        if [ "done" == "$load" ];then
            break
        fi
    done
    printf "...[ok]\n"
}

load_done(){
    echo "done">/tmp/load.tmp
}

case "$1" in
   load) loading &;;
   ok) load_done;;
   *) ;;
esac
