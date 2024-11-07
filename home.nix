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

      # Jetbrains IDEs
      jetbrains.clion
      llvmPackages_19.libcxxClang
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      python3
      # Rider is installed as a flatpak because of MSBuild issues
      jetbrains.rust-rover
      rustc
      cargo

      # Other IDEs
      arduino
      godot_4

      # RStudio
      rstudio
      libxml2.dev
    ];
  };
}

