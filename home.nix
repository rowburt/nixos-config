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
      jq
      lm_sensors
      ripgrep

      # Useful GNOME packages
      gnome-disk-utility
      gnome-software
      gnome-tweaks
      nautilus

      # Desktop apps
      alpaca
      deja-dup
      discord
      prismlauncher

      # Jetbrains IDEs
      jetbrains.clion
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      # Rider is installed as a flatpak because of MSBuild issues
      jetbrains.rust-rover

      # Dependencies
      cargo
      gcc
      jdk
      python3
      rustc

      # Other IDEs
      arduino
      godot_4

      # RStudio
      rstudio
      libxml2.dev
    ];
  };
}
