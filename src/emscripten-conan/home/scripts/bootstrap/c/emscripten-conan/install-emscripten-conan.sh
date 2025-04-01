#!/bin/bash

set -euxo pipefail
bash --version

pip install conan --quiet

mkdir -p $HOME/.conan2
