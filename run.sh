#!/bin/bash

root=$(pwd)

# Função para inicializar os containers (up)
function init {
  if [ "$1" == "all" ] || [ "$1" == "sprint1" ]; then
    (cd "$root/sprint1" && docker-compose up -d) &
  fi
  if [ "$1" == "all" ] || [ "$1" == "sprint2" ]; then
    (cd "$root/sprint2" && docker-compose up -d) &
  fi
  if [ "$1" == "all" ] || [ "$1" == "sprint3" ]; then
    (cd "$root/sprint3" && docker-compose up -d) &
  fi
}

# Função para parar os containers (down)
function down {
  if [ "$1" == "all" ] || [ "$1" == "sprint1" ]; then
    (cd "$root/sprint1" && docker-compose down) &
  fi
  if [ "$1" == "all" ] || [ "$1" == "sprint2" ]; then
    (cd "$root/sprint2" && docker-compose down) &
  fi
  if [ "$1" == "all" ] || [ "$1" == "sprint3" ]; then
    (cd "$root/sprint3" && docker-compose down) &
  fi
}

# Criação da rede Docker
docker network create sprint1_network

# Verificação do argumento fornecido pelo usuário
if [ "$1" == "up" ]; then
  if [ -z "$2" ] || [ "$2" == "all" ]; then
    init "all"
  else
    init "$2"
  fi
elif [ "$1" == "down" ]; then
  if [ -z "$2" ] || [ "$2" == "all" ]; then
    down "all"
  else
    down "$2"
  fi
else
  echo "Uso: $0 {up|down} [sprint1|sprint2|sprint3|all]"
  exit 1
fi
