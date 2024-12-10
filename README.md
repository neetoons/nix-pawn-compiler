# nix-pawn-compiler
A nix/NixOS package for pawn compiler

## Implementation
```nix
environment.systemPackages = [
    (pkgs.callPackage ./nix-pawn-compiler/pawncc/default.nix {})
];
```

Thanks [krovuxdev]https://github.com/krovuxdevhttps://github.com/krovuxdev) for help
