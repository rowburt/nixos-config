{ pkgs, zen-browser, ... }:

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
      lm_sensors

      # Useful GNOME packages
      gnome-disk-utility
      gnome-software
      gnome-tweaks
      nautilus

      # Desktop apps
      deja-dup
      discord
      iotas
      prismlauncher
      zen-browser.packages."${system}".default

      # Jetbrains IDEs
      jetbrains.clion
      jetbrains.idea-ultimate
      jetbrains.rider
      jetbrains.webstorm
      nodejs_23

      # Dependencies
      gcc
      jdk
      mono
      dotnet-sdk_9

      # Other IDEs
      arduino
      godot_4
    ];
  };
}
