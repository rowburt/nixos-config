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
      glide-media-player
      iotas
      onlyoffice-desktopeditors
      prismlauncher

      # Jetbrains IDEs
      # jetbrains.idea-ultimate
      # jetbrains.rider

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

      # LaTeX
      texliveFull
      texstudio
    ];
  };
}
