{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ccorbett";
  home.homeDirectory = "/home/ccorbett";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.jq
    pkgs.any-nix-shell
    pkgs.direnv
  ];

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
      init.defaultBranch = "main";
      push.default = "tracking";
      github.user = "asciifaceman";
    };
  };

#  programs.neovim = {
#    enable = true;  
#    plugins = with pkgs; [
#      pkgs.vimPlugins.vim-nix
#      pkgs.vimPlugins.vim-markdown
#      pkgs.customVim.nvim-treesitter
#      pkgs.customVim.vim-fish
#    ];
#    extraConfig = (import ./vim-config.nix) { };
#  };

  programs.gpg.enable = true;

  programs.bash = {
    enable = true;
  };

  imports = builtins.concatMap import [
    ./programs
  ];




  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ccorbett/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";
    defaultCacheTtl = 1200; # 600 = 10 minutes
    maxCacheTtl = 31536000;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
