{ niri, pkgs, ... }:

{
  imports = [
    niri.homeModules.niri

    ./kanshi.nix
    ./noctalia.nix
  ];

  programs.niri = {
    enable = true;

    # Use the package enabled in host/modules/niri.nix
    package = pkgs.niri;
  };

  services = {
    polkit-gnome.enable = true;
  };
}
