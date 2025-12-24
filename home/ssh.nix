{ pkgs, dotfiles, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "hosky";
        identityFile = "~/.ssh/id_github";
      };
    };
  };
}
