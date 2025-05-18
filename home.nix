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

      # Desktop apps
      deja-dup
      discord
      iotas
      onlyoffice-desktopeditors
      prismlauncher

      # Jetbrains IDEs
      jetbrains.clion
      jetbrains.idea-ultimate
      jetbrains.rider
      jetbrains.webstorm
      nodejs_24
      vite

      # Other IDEs
      arduino
      godot_4

      # Dependencies
      dart
      dotnet-sdk_9
      gcc
      gradle
      jdk
      mono
      rustup
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

      # LaTeX
      texliveFull
      texstudio
    ];
  };
}
