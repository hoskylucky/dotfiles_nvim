{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  hardeningDisable = [ "fortify" ];
  packages = with pkgs; [
    gcc
    gnumake
    ninja
    clang-tools
    cmake
    zip
    pkg-config
    nasm
    libtool
    autoconf
    automake
    zlib.dev
    valgrind # 内存调试工具，GCC 开发常配套使用
  ];
}

