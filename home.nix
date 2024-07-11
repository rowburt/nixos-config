{ pkgs, ... }:

{
  imports = [ ./programs ];
  
  home = {
    username = "robert";
    homeDirectory = "/home/robert";
    stateVersion = "24.05";
    
    # Set default apps
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
    
    # Install generic user packages
    packages = with pkgs; [
      # Terminal utils
      curl
      gnupg
      htop
      jq
      lm_sensors
      
      # Useful GNOME packages
      gnome-disk-utility
      gnome.gnome-software
      gnome-tweaks
      nautilus
      
      # Desktop apps
      deja-dup
      discord
      firefox
      mission-center
      
      # Jetbrains IDEs
      # Rider is installed as a flatpak because of MSBuild issues
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      jetbrains.clion
      
      # Other IDEs
      arduino
      godot_4
      rstudio
      zed-editor
    ];
  };
}

