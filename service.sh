#!/bin/bash

function init {
    docker compose up -d 
    cd ../sprint1/dns && docker compose up -d 
}

init
