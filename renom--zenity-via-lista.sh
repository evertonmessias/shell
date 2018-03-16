#!/bin/bash

zenity --info --title="Everton Scripts" --text="RENOMEADOR DE ARQUIVOS EM LOTE"

origem=`zenity --file-selection --title="Escolha o diretorio de ORIGEM dos arquivos a serem renomeados" --directory`

destino=`zenity --file-selection --title="Escolha um diretorio de DESTINO (diferente) para os arquivos serem renomeados" --directory`

tabela=`zenity --file-selection --title="Escolha o arquivo (texto) com os nomes de DESTINO que você prefere, em ordem"`

if [ -z $tabela ] || [ -z $destino ] || [ -z $origem ];then 

zenity --warning --title="ERRO !!!" --text="FALTA INFORMAÇÕES PARA PROSSEGUIR.."

exit

else

DATA=`date +%d-%m-%Y-%H.%M.%S`

mkdir -p $destino/$DATA

n=1

for arquivo in $origem/*

do

novo=`sed -n "$n p" $tabela`

cp -R "$arquivo" "$destino/$DATA/$novo"

echo "***** ==> $arquivo ==> $DATA/$novo ..... OK ******"

n=`expr $n + 1`

done

zenity --info --title="Renomeador" --text="Concluido"

nautilus $destino/$DATA &

fi
