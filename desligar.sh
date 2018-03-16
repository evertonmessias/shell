#!/bin/bash
#
# Desliga PC com mostrador real formatado HH:MM:SS
# precisa ser root para desligar o PC
#
#
usuario=`id |cut -c 5`
if (($usuario == 0));then
function contaminutos(){ 
for ((M=$MINUTOS;M>=0;M--))do
for ((S=59;S>=0;S--))do
clear
h=$(printf '%.2d' $H)
m=$(printf '%.2d' $M)
s=$(printf '%.2d' $S)
echo "Desligando em $h:$m:$s"
sleep 1
if (($H == 0 && $M == 0 && $S == 0));then
echo "DESLIGANDO ..."
init 0 #precisa ser root aqui
fi
done
done
}
#main
clear
echo -n "Quantos minutos? ";read TEMPO
if (($TEMPO <= 60));then
MINUTOS=$(($TEMPO - 1))
H=0
contaminutos
else
HORAS=$(($TEMPO / 60))
MINUTOS=$(($TEMPO % 60))
if (($MINUTOS == 0));then
MINUTOS=59
HORAS=$(($HORAS - 1))
else
MINUTOS=$(($MINUTOS - 1))
fi
for ((H=$HORAS;H>=0;H--))do
if (($H == 0));then
MINUTOS=59
fi
contaminutos
done
fi
else
echo "==> Precisa ser root !!!";
exit
fi
