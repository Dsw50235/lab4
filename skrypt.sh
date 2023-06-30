#!/bin/bash

if [[ $1 == "--data" ]]; then
    current_date=$(date +%Y-%m-%d)
    echo "Aktualna data: $current_date"
elif [[ $1 == "--logs" ]]; then
    if [[ -z $2 ]]; then
        num_logs=100
    else
        num_logs=$2
    fi

    for ((i=1; i<=num_logs; i++))
    do
        filename="log${i}.txt"
        echo "Nazwa pliku: ${filename}" > "${filename}"
        echo "Nazwa skryptu: $0" >> "${filename}"
        echo "Data utworzenia: $(date)" >> "${filename}"
    done
else
    echo "Podaj argument --data lub --logs [liczba], aby uruchomić skrypt."
fi
