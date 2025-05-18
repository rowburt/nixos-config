{ ... }:

{
  # Import programs we want installed and/or configured
  imports = [
    ./alacritty.nix
    ./dconf.nix
    ./git.nix
    ./zed
    ./zen-browser.nix
    ./zsh.nix
  ];
}
