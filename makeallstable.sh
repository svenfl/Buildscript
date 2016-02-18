#!/bin/sh
OPTIONS="DEFAULT_GLUON_BRANCH=stable DEFAULT_GLUON_RELEASE=stable-2016.1.0-0"
CORES=$(lscpu|grep -e '^CPU(s):'|xargs|cut -d" " -f2)
  echo "Kompiliert wird auf $CORES Kernen"
for TARGET in ar71xx-generic ar71xx-nand mpc85xx-generic x86-64 x86-generic x86-kvm_guest x86-xen_domu; do
  echo "################# $TARGET ###########################"
  make -j$CORES GLUON_TARGET=$TARGET $OPTIONS || break
  echo "############$TARGET fertig ##########################" 
done && echo "alle Targets wurden erfolgreich erstellt." || echo "Fehlschlag! Abbruch"

