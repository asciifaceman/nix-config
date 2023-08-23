{ config, pkgs, lib, ... }:

let
  themeConfig = ''
    set -g theme_nerd_fonts yes
  '';

  #custom = pkgs.callPackage ./plugins.nix { };

  fenv = {
    inherit (pkgs.fishPlugins.foreign-env) src;
    name = "foreign-env";
  };

  bfish = {
    inherit (pkgs.fishPlugins.bobthefish) src;
    name = "bobthefish";
  };

in
{
  programs.fish = {
    enable = true;
    #plugins = [ custom.theme fenv ];
    plugins = [ fenv ];
    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" ([
      "eval (direnv hook fish)"
      "any-nix-shell fish --info-right | source"
      (builtins.readFile ./config.fish)
      "set -g SHELL ${pkgs.fish}/bin/fish"
    ]));

  };
}
