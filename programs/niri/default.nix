{ niri, pkgs, ... }:

{
  imports = [
    niri.homeModules.niri

    ./kanshi.nix
    ./noctalia.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services = {
    polkit-gnome.enable = true;
  };
}
