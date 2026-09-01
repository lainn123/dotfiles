#!/bin/bash

set -e

echo "==> Atualizando o sistema e instalando pacotes do repositório oficial..."
if [ -f pacman-packages.txt ]; then
    sudo pacman -Syu --needed --noconfirm - < pacman-packages.txt
fi

echo "==> Copiando configurações para ~/.config/..."
mkdir -p ~/.config
cp -r .config/* ~/.config/

echo "==> Instalação e restauração concluídas com sucesso!"
