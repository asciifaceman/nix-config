let
  more = { pkgs, ...}: {
    programs = {
      htop = {
        enable = true;
      };
    };
  };
in
  [
    ./fish
    ./neovim
    ./git
    more
  ]
