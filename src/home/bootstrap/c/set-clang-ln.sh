#!/bin/bash

set -euxo pipefail
bash --version

ln -s /usr/bin/clang-14 /usr/local/bin/clang
ln -s /usr/bin/clang++-14 /usr/local/bin/clang++
