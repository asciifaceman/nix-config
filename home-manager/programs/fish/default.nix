{ config, pkgs, lib, ... }:

let
  plugin_list = [
    "foreign-env"
    "tide"
  ];

in
{
  programs.fish = {
    enable = true;
    plugins = with pkgs; map (n: {
      name = n;
      src = pkgs.fishPlugins.${n}.src;
    }) plugin_list;
    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
      "eval (direnv hook fish)"
      "any-nix-shell fish --info-right | source"
      (builtins.readFile ./config.fish)
      "set -g SHELL ${pkgs.fish}/bin/fish"
    ]));

  };
}
