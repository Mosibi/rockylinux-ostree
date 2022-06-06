# Rocky Linux Ostree
This repository contains all the bits to get a working Ostree for Rocky Linux (8.6)

## Dir: bootserver
Contains an Ansible playbook to configure a PXE bootserver

## Dir: ostree-config
Contains the config files to build a basic Ostree for Rocky Linux

# How to use
From the root directory of this project:
* Create a build directory with the repo and cache directory below it. The repo directory will have the final OStree repository where you could boot from.
* Initialize the ./build/repo directory as a OStree repository
* Build the OStree repo

```
mkdir -p ./build/{repo,cache}
ostree --repo=./build/repo init --mode=archive
sudo rpm-ostree --unified-core compose tree  --cachedir=./build/cache  --repo=./build/repo config/manifest.yaml
```

When the compose state is finished, rsync the repo to the bootserver and network boot from it.

```
sudo rsync -av --delete ./build/repo root@192.168.122.89:/var/www/html/ostree/
```