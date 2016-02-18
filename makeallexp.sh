#!/bin/sh
OPTIONS="BROKEN=1 DEFAULT_GLUON_BRANCH=experimental DEFAULT_GLUON_RELEASE=2016.1-exp-$(date  '+%m-%d_%H_%M')"
CORES=$(lscpu|grep -e '^CPU(s):'|xargs|cut -d" " -f2)
  echo "Kompiliert wird auf $CORES Kernen"
for TARGET in ar71xx-generic ar71xx-nand brcm2708-bcm2708 brcm2708-bcm2709 mpc85xx-generic ramips-rt305x sunxi x86-64 x86-generic x86-kvm_guest x86-xen_domu; do
  echo "################# $TARGET ###########################"
  make -j$CORES GLUON_TARGET=$TARGET $OPTIONS || break 
  echo "##############$TARGET fertig#########################"
done && echo "alle Targets wurden erfolgreich erstellt." || echo "Fehlschlag! Abbruch"

