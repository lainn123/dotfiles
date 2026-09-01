#!/bin/bash

set -e

echo "==> Atualizando o sistema e instalando os aplicativos essenciais..."
sudo pacman -Syu --needed --noconfirm \
    starship \
    mpd \
    ncmpcpp \
    rofi \
    hyprland \
    micro \
    dunst \
    foot \
    fish \
    fastfetch \
    ark \
    swaybg \
    hyprlock \
    hyprpicker \
    grim \
    slurp \
    opendoas \
    wl-clipboard

echo "==> Aplicando configuração do doas..."
echo "permit :wheel" | sudo tee /etc/doas.conf > /dev/null

echo "==> Copiando diretórios de configuração para ~/.config/..."
mkdir -p ~/.config
cp -r .config/* ~/.config/

echo "==> Instalação concluída!"
