{ pkgs ? import <nixpkgs> { } }:
let
  stdenv = pkgs.clangStdenv;
in
pkgs.mkShell.override { inherit stdenv; } rec {
  hardeningDisable = [ "fortify" ];
  packages = with pkgs; [
    clang
    clang-tools
    bintools
    cmake
    ninja
    lldb
    zip
    pkg-config
    nasm
    libtool
    autoconf
    automake
    zlib
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath (packages ++ [ pkgs.gcc.cc.lib ])}:$LD_LIBRARY_PATH"
  '';
}

