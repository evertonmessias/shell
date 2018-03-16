#!/bin/bash
#
# Este script faz o calculo de uma equacao do 2o grau, necessario ter instalado o "dialog" e o "bc"
#
dialog --backtitle 'EQUACAO DO 2o GRAU' --msgbox 'Bem-vindo ao programa para calculo de uma equacao do 2o grau por Everton Messias       FORMATO : Ax2 + Bx + C = 0' 0 0
a=$( dialog --stdout --inputbox 'Digite o valor do termo "A":' 0 0 )
b=$( dialog --stdout --inputbox 'Digite o valor do termo "B":' 0 0 )
c=$( dialog --stdout --inputbox 'Digite o valor do termo "C":' 0 0 )
d1=`echo "$b" ^ 2|bc`
d2=`echo 4 \* "$a" \* "$c"|bc`
delta=`echo "$d1" - "$d2"|bc`
q=`echo 2 \* "$a"|bc`
i=`echo -1 \* "$b"|bc`
if (( $delta < 0 ));then
dialog --backtitle 'EQUACAO DO 2o GRAU' --msgbox 'NAO EXISTE RAIZES REAIS !' 0 0
clear
exit
else
raiz=`echo "sqrt("$delta")"|bc`
xa=`echo "$i" + "$raiz"|bc`
xb=`echo "$i" - "$raiz"|bc`
x1=`echo "$xa" / "$q"|bc`
x2=`echo "$xb" / "$q"|bc`
dialog --backtitle 'EQUACAO DO 2o GRAU' --msgbox 'O valor de X1= '"$x1"'     O valor de X2= '"$x2" 0 0
fi
dialog --yesno 'Deseja continuar ?' 0 0
if (( "$?" == 0 ));then
./eq.sh
else
clear
exit
fi

