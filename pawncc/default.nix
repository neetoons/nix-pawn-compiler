{
  pkgs ? import <nixpkgs> { },
}:
pkgs.multiStdenv.mkDerivation rec {
  pname = "pawncc";
  version = "3.10.10";
  src = pkgs.fetchFromGitHub {
    owner = "pawn-lang";
    repo = "compiler";
    rev = "v${version}";
    hash = "sha256-UBMfL7GwfVzU+bjCtALZEswoQ2sy1jC4evGORnLfqR8=";
  };

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_C_FLAGS=-m32"
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
    mkdir -p $out/bin $out/lib $out/include
    cp pawncc pawndisasm pawnruns $out/bin
    cp libpawnc.so $out/lib/libpawnc.so
    cp -r ../../include $out/include
  '';

  doCheck = false;
}
