# Emscripten Conan Devcontainer

A devcontainer image for C, C++ development with Conan and Emscripten.

## Features

- git
- pip
- clang-14
- cmake
- curl
- vim

Also includes:
- A colorful `.bashrc` with `vi` support
- An `.inputrc` file with `vi` mode indicator
- A lovely script file for creating .env file example for pushing to a
  public repo.

## Caveats

This container runs as root. This will definitely be changed in future 
versions.
