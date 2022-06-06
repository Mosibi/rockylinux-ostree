#!/bin/bash

Error () {
	echo "Oops, something did not work"
	exit 101
}

sudo rm -rf ./build || Error
mkdir -p ./build/{repo,cache} || Error
ostree --repo=build/repo init --mode=archive || Error
sudo rpm-ostree --unified-core compose tree  --cachedir=./build/cache  --repo=./build/repo config/manifest.yaml || Error
sudo rsync -av --delete ./build/repo root@192.168.122.89:/var/www/html/ostree/ || Error
