#!/bin/bash

if [ -z "$1" ]; then
  echo "fastfetch: lnconfig <filename>"
  exit 1
fi

filename=$1
config_path="$HOME/.config/fastfetch"

if [ -f "$config_path/available_configs/$filename" ]; then
  if [ -L "$config_path/config.jsonc" ]; then
    read -p "config.jsonc already exists. Do you want to replace it? (y/n) " yn
    case $yn in
        [Yy]* ) rm "$config_path/config.jsonc";;
        [Nn]* ) echo "Operation canceled."; exit;;
        * ) echo "Please answer yes or no."; exit 1;;
    esac
  fi

  ln -s "$config_path/available_configs/$filename" "$config_path/config.jsonc"
  echo "fastfetch: symbolic link created: available_configs/$filename -> config.jsonc"
else
  echo "fastfetch: $filename not found in available_configs directory."
  exit 1
fi
