#!/bin/bash

function usage() {
  echo "Usages: $0 [options]"
  echo "[options] : "
  echo "           build"
  echo "           run-server"
  echo "           stop-server"
  echo "           run-client"
  echo "           stop-client"
}

# check parameter
if [ "$#" -lt 1 ]; then
  echo "$# is Illegal number of parameters."
  usage
  exit 1
else
  echo "$0"

  if [ "$1" == "build" ]; then
    ./configure;
    cd tmp;
    make hamcorebuilder;
    make vpnserver;
    make vpnclient;
    ./hamcorebuilder ../src/bin/hamcore ../build/hamcore.se2
  fi

  if [ "$1" == "run-server" ]; then
    ./build/vpnserver start
    chown -R 0x4861:staff build
  fi

  if [ "$1" == "stop-server" ]; then
    ./build/vpnserver stop
    chown -R 0x4861:staff build
    vi ./build/server_log/
  fi

  if [ "$1" == "run-client" ]; then
    echo " run client "
  fi

  if [ "$1" == "stop-client" ]; then
    echo " stop client "
  fi

fi

