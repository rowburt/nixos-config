{ niri, pkgs, ... }:

{
  imports = [
    niri.homeModules.niri

    ./kanshi.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  programs = {
    fuzzel.enable = true;
    # swaylock.enable = true;
    waybar.enable = true;
  };

  services = {
    awww.enable = true;
    mako.enable = true;
    polkit-gnome.enable = true;
  };
}
