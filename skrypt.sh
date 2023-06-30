#!/bin/bash

if [[ $1 == "--logs" ]]; then
    for ((i=1; i<=100; i++))
    do
        filename="log${i}.txt"
        echo "Nazwa pliku: ${filename}" > "${filename}"
        echo "Nazwa skryptu: $0" >> "${filename}"
        echo "Data utworzenia: $(date)" >> "${filename}"
    done
else
    echo "Podaj argument --logs, aby uruchomić skrypt i utworzyć 100 plików."
fi