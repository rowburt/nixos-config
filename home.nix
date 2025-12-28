{ pkgs, ... }:

{
  imports = [ ./programs ];

  home = {
    username = "robert";
    homeDirectory = "/home/robert";
    stateVersion = "24.05";

    # Install generic user packages
    packages = with pkgs; [
      # Terminal utils
      btop
      curl
      gnupg
      gource
      jq
      just
      lm_sensors
      sqlite

      # Desktop apps
      deja-dup
      iotas
      onlyoffice-desktopeditors
      prismlauncher

      # IDEs
      arduino
      godot_4

      # Dependencies
      dotnet-sdk_9
      flutter
      gcc
      gradle
      jdk
      mono
      nodejs
      pnpm
      python3
      rustup
      uv
      zig

      # Useful GNOME packages
      gnome-calculator
      gnome-clocks
      gnome-disk-utility
      gnome-software
      gnome-text-editor
      gnome-tweaks
      decibels
      loupe
      nautilus
      papers
      showtime
    ];
  };
}
