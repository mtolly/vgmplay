#!/bin/bash

mkdir -p stems

rm -f obj/chips/multipcm.o
make vgmplay MACOSX=1 DISABLE_HWOPL_SUPPORT=1 GETSAMPLE=CurSmpl
./vgmplay $1.vgz
mv $1.wav stems/whole.wav

for i in {0..511}
do
  rm -f obj/chips/multipcm.o
  make vgmplay MACOSX=1 DISABLE_HWOPL_SUPPORT=1 GETSAMPLE=$i
  ./vgmplay $1.vgz
  flac -8 $1.wav
  rm $1.wav
  mv $1.flac stems/$(printf "%03d" $i).flac
done
