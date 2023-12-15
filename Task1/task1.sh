#!/bin/bash

existing_user="$1"
directory_path="$2"

if [ "$(whoami)" != "root" ]; then
    echo -e "\e[0;31mПомилка\e[0m: Цей скрипт може виконувати тільки користувач з правами ROOT."
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo -e "\e[0;31mПомилка\e[0m: Використання: $0 <існуючий_користувач> <шлях_до_каталогу>"
    exit 1
fi

if [ -d "$directory_path" ]; then
    chown -R "$existing_user" "$directory_path"
    if [ $? -eq 0 ]; then
        echo -e "\e[0;32mЗмінено\e[0m: Власник файлів і каталогів успішно змінений на $existing_user."
    else
        echo -e "\e[0;31mПомилка\e[0m: Неможливо змінити власника файлів і каталогів."
        exit 1
    fi
else
    echo -e "\e[0;31mПомилка\e[0m: $directory_path не є каталогом або не існує."
    exit 1
fi

exit 0

