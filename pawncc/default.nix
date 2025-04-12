{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation rec {
  pname = "pawncc";
  version = "3.10.10";
  src = pkgs.fetchFromGitHub {
    owner = "pawn-lang";
    repo = "compiler";
    rev = "v${version}";
    hash = "sha256-UBMfL7GwfVzU+bjCtALZEswoQ2sy1jC4evGORnLfqR8=";
  };

  cmakeFlags = [
    "-DBUILD_TESTING=OFF"
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DCMAKE_POLICY_DEFAULT_CMP0025=NEW"
    "-Wno-dev"
    "-DCMAKE_INSTALL_PREFIX="
    "-DCMAKE_SOURCE_DIR=source/compiler" 
  ];

  nativeBuildInputs = with pkgs; [
    cmake
  ];

  configurePhase = ''
    cd source/compiler
    cmake ${pkgs.lib.concatStringsSep " " cmakeFlags} 
  '';

  installPhase = "make";

  fixupPhase = ''
    mkdir -p $out/bin $out/lib
    cp -r pawncc $out/bin/pawncc
    cp -r libpawnc.so $out/lib/libpawnc.so
  '';

  doCheck = false;
}
