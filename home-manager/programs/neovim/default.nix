{ config, pkgs, lib, xdg, ... }:

let
  #custom = pkgs.callPackage ./plugins.nix { };

  vnix = {
    inherit (pkgs.vimPlugins.vim-nix) src;
    name = "vim-nix";
  };

in
{
  programs.neovim = {
    enable = true;
    #plugins = [ vnix ];
    plugins = with pkgs; [
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.vim-markdown
      pkgs.vimPlugins.vim-fish
      pkgs.vimPlugins.YouCompleteMe
      pkgs.vimPlugins.nvim-tree-lua
    ];
    #extraConfig = lib.fileContents ./init.lua;
  };
  xdg.configFile.nvim.source = ./nvim;
}

