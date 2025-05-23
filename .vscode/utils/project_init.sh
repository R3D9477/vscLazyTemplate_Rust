#!/bin/bash

if ! [ -f Cargo.toml ] ; then
    sed -i 's/\r$//' .vscode/utils/*.sh
    sudo chown -R build:build .

    cargo init
    cargo new lib --lib

    echo "lib = { path = 'lib' }" >> "Cargo.toml"
    echo -e "use lib;\n\n$(cat src/main.rs)" > src/main.rs
    sed -i 's/"Hello, world!"/"Hello, world from lib {}!", lib::add(1, 2)/g' src/main.rs
fi
