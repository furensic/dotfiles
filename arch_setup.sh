#!/usr/bin/env bash

config_dir="$HOME/.config"

if [ ! -d "$config_dir" ]; then
	echo "Creating $config_dir"
	mkdir -p "$config_dir"
fi
