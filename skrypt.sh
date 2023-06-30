#!/bin/bash

current_date=$(date +%Y-%m-%d)

if [[ $1 == "--data" ]]; then
    echo "Podana data: $current_date"
else
    echo "Bieżąca data: $current_date"
fi
