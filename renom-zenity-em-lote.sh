#!/bin/bash

zenity --info --title="Everton Scripts" --text="RENOMEADOR DE ARQUIVOS EM LOTE"

padrao=`zenity --entry --title="Renomeador" --text="Digite um PADRAO de nome, ex: em FOTO1, FOTO2, ... o padrao eh FOTO"`; if [ -z $padrao ];then exit; fi

extensao=`zenity --entry --title="Renomeador" --text="Digite a extensao para os arquivos de saida, ex: jpg, mp3, doc ..."`; if [ -z $extensao ];then exit; fi

origem=`zenity --file-selection --title="Escolha o diretorio de ORIGEM dos arquivos a serem renomeados" --directory`; if [ -z $origem ];then exit; fi

destino=`zenity --file-selection --title="Escolha o diretorio de DESTINO dos arquivos a serem renomeados" --directory`; if [ -z $destino ];then exit; fi

DATA=`date +%d-%m-%Y-%H.%M.%S`

mkdir -p $destino/$DATA

n=1

for file in $origem/*
do

cp -R $file $destino/$DATA/$padrao$n.$extensao

echo "$file ==> $DATA/$padrao$n.$extensao ..... OK"

n=`expr $n + 1`

done

zenity --warning --title="Renomeador" --text="Concluido"

nautilus $destino/$DATA &


