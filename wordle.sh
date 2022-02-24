#!/bin/bash
cp 5.txt jur

function comprueba {
  silaba=$1
  posicion=$2
  palabra=$3
  letra=${silaba:0:1}
  acierto=${silaba:1:1}
  if [ $acierto -eq 0 ]
  then
    # cuento cuantas veces sale la letra, si sale 2 veces no la quito, si sale 1 si
    if [ `echo $palabra | tr -cd $letra | wc -c` -eq 1 ]
    then
      grep -v $letra jur> jur2
      mv jur2 jur
    else
      # tenemos que quitar todas las a menos de la posición que de 2
      for j in 1 2 3 4 5
      do
        if [ ${palabra:$j-1:1} == $letra ] && [ ${palabra:$j+4:1} -ne 2 ] || [ ${palabra:$j-1:1} != $letra ]
        then
          cadena=`echo '12345' | sed -e 's/'${j}'/'${letra}'/g' -e 's/[1-5]/./g'`
          grep -v $cadena jur> jur2
          mv jur2 jur
        fi
      done
    fi
  fi

  if [ $acierto -eq 1 ]
  then
    sed -ni /${letra}/p jur
    cadena=`echo '12345' | sed -e 's/'${posicion}'/'${letra}'/g' -e 's/[1-5]/./g'`
    grep -v $cadena jur> jur2
    mv jur2 jur
  fi

  if [ $acierto -eq 2 ]
  then
    cadena=`echo '12345' | sed -e 's/'${posicion}'/'${letra}'/g' -e 's/[1-5]/./g'`
    sed -ni /${cadena}/p jur
  fi
}


cp 5.txt jur

for palabra in $@
do
  for i in 1 2 3 4 5
  do
    silaba=${palabra:$i-1:1}${palabra:$i+4:1}
    comprueba $silaba $i $palabra
  done
done
sort -R jur 
wc -l < jur
