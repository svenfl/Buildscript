#!/bin/bash
OPTIONS="DEFAULT_GLUON_BRANCH=stable DEFAULT_GLUON_RELEASE=stable-2016.1.0-0"
#OPTIONS="BROKEN=1 DEFAULT_GLUON_RELEASE=2016.1-exp-$(date  '+%m-%d_%H_%M')"
CORES=$(lscpu|grep -e '^CPU(s):'|xargs|cut -d" " -f2)
for TARGET in ar71xx-generic ar71xx-nand mpc85xx-generic x86-generic x86-kvm_guest x86-64 x86-xen_domu; do
  echo "################# $TARGET ###########################"
  make -j$CORES GLUON_TARGET=$TARGET $OPTIONS || break 
done && echo "alle Targets wurden erfolgreich erstellt." || echo "Fehlschlag! Abbruch"

