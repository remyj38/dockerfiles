#!/bin/sh

if [ -z "$DH_SIZE" ]; then
	DH_SIZE=2048
fi

if [ -z "$DH_PATH" ]; then
	DH_PATH="/etc/nginx/ssl"
fi

if [ -z "$DH_FILE" ]; then
	DH_FILE="dhparam.pem"
fi

# Stop execution if DH_PATH is a file
if [ -f "$DH_PATH" ]; then
	echo "$DH_PATH is a file. Please set DH_PATH to a folder"
	exit 1
fi

# Stop execution if DH_FILE is a folder
if [ -d "$DH_PATH/$DH_FILE" ]; then
	echo "$DH_PATH/$DH_FILE is a folder. Please set DH_FILE to a file"
fi

if [ -n "$FORCE_DH_GENERATION" -o ! -f "$DH_PATH/$DH_FILE" ]; then
	if [ -d "$DH_PATH" ]; then
		mkdir -p "$DH_PATH"
	fi
	openssl dhparam -out "$DH_PATH/$DH_FILE" $DH_SIZE
fi

exec "$@"
