#!/bin/bash
#Script para Copiar o 'Nome do Arquivo' para a Informação 'Metadata-Title' de arquivos mkv
for videos in *.mkv
do
mkvpropedit "$videos" --edit info --set "title=$videos"
echo "$videos ==> OK"
done

#Obs.: Para remover TODOS os 'Metadata' de arquivos mp4 use: exiftool -all= -overwrite_original .
