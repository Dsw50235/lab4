#!/bin/bash

if [[ $1 == "--help" ]]; then
    echo "Dostępne opcje:"
    echo "-d, --date - wyświetla aktualną datę"
    echo "-l, --logs [liczba] - tworzy określoną liczbę plików logx.txt"
    echo "--help - wyświetla dostępne opcje (argumenty)"
elif [[ $1 == "-d" || $1 == "--date" ]]; then
    current_date=$(date +%Y-%m-%d)
    echo "Aktualna data: $current_date"
elif [[ $1 == "-l" || $1 == "--logs" ]]; then
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
elif [[ $1 == "-e" || $1 == "--error" ]]; then
    if [[ -z $2 ]]; then
        num_errors=100
    else
        num_errors=$2
    fi

    for ((i=1; i<=num_errors; i++))
    do
        error_dir="error${i}"
        filename="${error_dir}/error${i}.txt"
        mkdir -p "${error_dir}"
        echo "Nazwa pliku: ${filename}" > "${filename}"
        echo "Nazwa skryptu: $0" >> "${filename}"
        echo "Data utworzenia: $(date)" >> "${filename}"
    done
elif [[ $1 == "--init" ]]; then
    git clone https://github.com/twoje-repozytorium.git

    export PATH=$PATH:$(pwd)/twoje-repozytorium
else
    echo "Podaj argument --help, aby wyświetlić dostępne opcje."
fi

