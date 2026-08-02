{ pkgs, ... }:

{
  imports = [ ./programs ];

  home = {
    username = "robert";
    homeDirectory = "/home/robert";
    stateVersion = "24.05";

    # Install generic user packages
    packages = with pkgs; [
      # Niri dependencies
      xwayland-satellite
      gamescope

      # Terminal utils
      btop
      curl
      gnupg
      gource
      jq
      just
      lm_sensors
      nh
      sqlite

      # Desktop apps
      deja-dup
      iotas
      onlyoffice-desktopeditors
      prismlauncher

      # IDEs
      jetbrains.clion
      jetbrains.idea

      # Dependencies
      dotnet-sdk_9
      flutter
      gcc
      gnumake
      gradle
      jdk25
      mono
      nodejs
      pnpm
      python3
      rustup
      uv
      zig
      zls

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
