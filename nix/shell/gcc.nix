{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    gcc
    gdb
    gnumake
    cmake
    ninja
    valgrind # 内存调试工具，GCC 开发常配套使用
  ];
}

