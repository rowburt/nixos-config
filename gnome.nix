{ config, pkgs, ... }:

{
  # Enable GNOME with GDM and disable most preinstalled apps
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.gnome.core-utilities.enable = false;
  
  # Exclude more default GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
  ];
  
  # Install GNOME extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    dash-to-dock
    pip-on-top
  ];
  
  # Workaround for GNOME bug
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}

