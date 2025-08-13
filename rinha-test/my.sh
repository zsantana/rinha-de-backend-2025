#!/usr/bin/env bash

startContainers() {
    pushd ../payment-processor > /dev/null
        docker compose up --build -d 1> /dev/null 2>&1
    popd > /dev/null
    pushd ../participantes/$1 > /dev/null
        services=$(docker compose config --services | wc -l)
        echo "" > docker-compose.logs
        nohup docker compose up --build >> docker-compose.logs &
    popd > /dev/null
}

stopContainers() {
    pushd ../participantes/$1 > /dev/null
        docker compose down -v --remove-orphans
        docker compose rm -s -v -f
    popd > /dev/null
    pushd ../payment-processor > /dev/null
        docker compose down --volumes > /dev/null
    popd > /dev/null
}

MAX_REQUESTS=550

# 🚨 Checagem do argumento obrigatório
if [ -z "$1" ]; then
    echo "Uso: $0 <nome-da-pasta-do-participante>"
    exit 1
fi

participant="$1"
directory="../participantes/$participant"

# 🚨 Checagem de pasta existente
if [ ! -d "$directory" ]; then
    echo "Erro: Pasta '$directory' não encontrada."
    exit 1
fi

echo "participant: $participant"
testedFile="$directory/partial-results.json"

if ! test -f $testedFile; then
    touch $testedFile
    echo "executing test for $participant..."
    stopContainers $participant
    startContainers $participant

    success=1
    max_attempts=15
    attempt=1
    while [ $success -ne 0 ] && [ $max_attempts -ge $attempt ]; do
        curl -f -s http://localhost:9999/payments-summary
        success=$?
        echo "tried $attempt out of $max_attempts..."
        sleep 5
        ((attempt++))
    done

    if [ $success -eq 0 ]; then
        echo "" > $directory/k6.logs
        k6 run -e MAX_REQUESTS=$MAX_REQUESTS -e PARTICIPANT=$participant --log-output=file=$directory/k6.logs rinha.js
        stopContainers $participant
        echo "======================================="
        echo "working on $participant"
        sed -i '1001,$d' $directory/docker-compose.logs
        sed -i '1001,$d' $directory/k6.logs
        echo "log truncated at line 1000" >> $directory/docker-compose.logs
        echo "log truncated at line 1000" >> $directory/k6.logs
    else
        stopContainers $participant
        echo "[$(date)] Seu backend não respondeu nenhuma das $max_attempts tentativas de GET para http://localhost:9999/payments-summary. Teste abortado." > $directory/error.logs
        echo "Could not get a successful response from backend... aborting test for $participant"
    fi
else
    echo "skipping $participant (partial-results.json já existe)"
fi
