{ config, pkgs, lib, ... }:

let
  git_default_branch = "main";
in
{
  programs.git = {
    enable = true;
    userName = "Charles Corbett";
    userEmail = "asciifaceman";
    aliases = {
      co = "checkout";
      cn = "checkout -b";
      ra = "remote add origin";
    };
    signing = {
      key = "D33AD0300F3F0057";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = git_default_branch;
      push.default = "tracking";
      github.user = "asciifaceman";
    };
  };
}
