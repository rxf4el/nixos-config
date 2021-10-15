#!/usr/bin/env bash

# machine_id="aspire-a315";

machine_id="$(uname -n)";

update_() {
  sudo nix flake update
}

switch_() {
  sudo nixos-rebuild switch --flake ."#${machine_id}";
}

boot_() {
  read -p "Collect Garbage? [y/N]: " opt

  if [[ $opt == "y" || $opt == "Y" ]]; then
    sudo nix-collect-garbage --delete-old;
    sudo nixos-rebuild boot --flake ."#${machine_id}";
  elif [[ $opt == "n" || $opt == "N" || -z $opt ]]; then
    sudo nixos-rebuild boot --flake ."#${machine_id}";
  else 
    echo "Wrong option!";
    boot_
  fi

  echo "DONE!";
  exit
}

build_() {
  sudo nixos-rebuild build --flake ."#${machine_id}";
}

case $@ in
  "update")
    update_
    ;;
  "switch")
    switch_
    ;;
  "boot")
    boot_
    ;;
  "build")
    build_
    ;;
  *)
    echo "Invalid argument!";
    exit;
    ;;
esac
