{ config, pkgs, lib, xdg, ... }:

let

  plugin_list = [
    pkgs.vimPlugins.vim-nix
    pkgs.vimPlugins.vim-markdown
    pkgs.vimPlugins.vim-fish
    pkgs.vimPlugins.YouCompleteMe
    pkgs.vimPlugins.nvim-tree-lua
    pkgs.vimPlugins.nvim-treesitter
    pkgs.vimPlugins.plenary-nvim
    pkgs.vimPlugins.telescope-nvim
  ];

  nvim_config_source = ./nvim;

in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs; plugin_list;
  };
  xdg.configFile.nvim.source = nvim_config_source;
}

