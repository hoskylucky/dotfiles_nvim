{ pkgs ? import <nixpkgs> { } }:
let
  stdenv = pkgs.llvmPackages_latest.libcxxStdenv;
in
pkgs.mkShell.override { inherit stdenv; } {
  packages = with pkgs; [
    llvmPackages_latest.clang-tools
    cmake
    ninja
    lldb
  ];

  # 显式设置环境变量以确保某些工具能找到正确的头文件（虽然 stdenv 应该处理大部分）
  CPATH = "${pkgs.llvmPackages_latest.libcxx.dev}/include/c++/v1";
}

