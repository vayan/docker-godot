# Godot Engine Docker Image

[![Docker Build](https://img.shields.io/docker/build/vayan/docker-godot.svg)](https://hub.docker.com/r/vayan/docker-godot/builds/)
![Docker Pull](https://img.shields.io/docker/pulls/vayan/docker-godot.svg)

Official Linux server builds of Godot Engine + the official templates

Godot Engine is located at `/usr/local/bin/godot` and the templates are installed in `/.local/share/godot/templates/${GODOT_VERSION}.stable`.

### Usage Example (Travis CI)

```yaml
services:
  - docker
install:
  - docker pull vayan/docker-godot
script:
  - docker run -v $(pwd):/build/src -v $(pwd)/output:/build/output vayan/docker-godot /bin/bash -c "godot --export-debug 'Mac OSX' /build/output/foo-mac.zip --path /build/src --quit -v"
deploy:
  - provider: releases
    skip-cleanup: true
    api_key: $GITHUB_TOKEN
    file_glob: true
    file: output/*
    on:
      branch: master
```
