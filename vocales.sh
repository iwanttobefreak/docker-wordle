#|/bin/bash
curl -s -o 0_palabras_todas.txt https://raw.githubusercontent.com/JorgeDuenasLerin/diccionario-espanol-txt/master/0_palabras_todas.txt

grep '^.....$' 0_palabras_todas.txt > jur_5.txt

sed -i -e s/á/a/g -e s/à/a/g -e s/è/e/g -e s/é/e/g -e s/í/i/g -e s/ì/i/g -e s/ó/o/g -e s/ò/o/g -e s/ú/u/g -e s/ù/u/g jur_5.txt

sort jur_5.txt | uniq > 5.txt
