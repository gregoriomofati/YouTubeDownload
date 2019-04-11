#!/bin/sh

# RULE=qmUQr3zrqXM:'Mundo_Bita_-_O_Circo_chegou [qmUQr3zrqXM].mkv'
RULE=3-SZp98VV2I:'1 Mundo Bita - Como uma Onda ft. Lulu Santos [3-SZp98VV2I].mkv'

SRC=$(echo ${RULE} | cut -d':' -f1)
DST=$(echo ${RULE} | cut -d':' -f2)

echo "source is ${SRC}"
echo "destination is ${DST}"

FROM=$(basename $(find . -name \*${SRC}\* | grep -v .fmt ) )

echo -e "renaming \n- ${FROM} \n+ ${DST}"


