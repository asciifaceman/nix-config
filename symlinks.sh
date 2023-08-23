#!/run/current-system/sw/bin/bash 
# Symlink configs to their target directories because
# I'm afraid of jumping right into the flake configs
# I see everyone doing
#
# Charles <asciifaceman> Corbett
#
#

ln -s $(pwd)/home-manager/ ~/.config/home-manager
