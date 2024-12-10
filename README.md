# nix-pawn-compiler
A Nix/NixOS package for [Pawn compiler](https://github.com/pawn-lang/compiler).

This package provides an easy-to-install and maintainable version of the Pawn Compiler for NixOS.

## Installation in configuration.nix
```nix
environment.systemPackages = [
    (pkgs.callPackage ./nix-pawn-compiler/pawncc/default.nix {})
];
```

Then, rebuild your system configuration:
```nix
sudo nixos-rebuild switch
```

## Usage
```sh
pawncc your_script.pwn
```

Thanks [krovuxdev](https://github.com/krovuxdevhttps://github.com/krovuxdev) for help
