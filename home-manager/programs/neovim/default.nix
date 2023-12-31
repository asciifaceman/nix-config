{ config, pkgs, lib, xdg, ... }:

let

#  plugin_list = [
#    pkgs.vimPlugins.vim-nix
#    pkgs.vimPlugins.vim-markdown
#    pkgs.vimPlugins.vim-fish
#    pkgs.vimPlugins.YouCompleteMe
#    pkgs.vimPlugins.nvim-tree-lua
#    pkgs.vimPlugins.plenary-nvim
#    pkgs.vimPlugins.telescope-nvim
#    pkgs.vimPlugins.nvim-lspconfig
#    pkgs.vimPlugins.nvim-treesitter
#    pkgs.vimPlugins.vim-go
#  ];

  #mutable_file_store = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/mutable";
  nvim_config_source = ./nvim;

in
{
  programs.neovim = {
    enable = true;
 #   plugins = with pkgs; plugin_list;
  };
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua".source = ./nvim/lua;
  #xdg.configFile.nvim.source = nvim_config_source;
  #xdg.configFile."nvim/lazy-lock.json".source = "${mutable_file_store}/lazy/lazy-lock.json";

  #xdg.configFile."nvim/lazy-lock.json".source = "${mutable_file_store}/.lazy-lock.json";
}

