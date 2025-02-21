# Projeto Docker Compose - Ambiente WordPress

Este repositório contém uma configuração de ambiente utilizando Docker Compose para executar um ambiente WordPress com bancos de dados MySQL e um container SSH. 

## Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/) instalado
- [Docker Compose](https://docs.docker.com/compose/install/) instalado

## Como Utilizar

### Subir o Ambiente

No diretório raiz do projeto, execute o seguinte comando para construir as imagens (caso necessário) e subir os containers:

```bash
docker-compose up -d
