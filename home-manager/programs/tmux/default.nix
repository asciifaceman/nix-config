{ config, pkgs, lib, ...}:
let
  tmux_config_source = ./tmux;
in
  {
    programs.tmux = {
      enable = true;
    };
    xdg.configFile.tmux.source = tmux_config_source'
  }
