{ pkgs ? import <nixpkgs> { } }:
let
  stdenv = pkgs.clangStdenv;
in
pkgs.mkShell.override { inherit stdenv; } {
  packages = with pkgs; [
    clang
    clang-tools
    cmake
    ninja
    lldb
    zip
    pkg-config
    nasm
    libtool
    autoconf
    automake
    zlib.dev
  ];
}

