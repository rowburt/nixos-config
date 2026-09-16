{ ... }:

{
  # Import programs we want installed and/or configured
  imports = [
    ./alacritty.nix
    ./dconf.nix
    ./git.nix
    ./neovim
    ./nh.nix
    ./niri
    ./tmux.nix
    ./zen-browser.nix
    ./zsh.nix
  ];
}
