#!/bin/bash
#Script para renomear arquivos em lote.
e=1
for videos in *.mkv
do
mv "$videos" "T10E$e - The Big Bang Theory.mkv"
echo "$videos ==> T10E$e - The Big Bang Theory.mkv ==> OK"
e=`echo "$e + 1"|bc`
done

