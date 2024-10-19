{ ... }:

{
  # Import programs we want installed and/or configured
  imports = [
    ./alacritty.nix
    ./dconf.nix
    ./firefox.nix
    ./git.nix
    ./zsh.nix
  ];
}
