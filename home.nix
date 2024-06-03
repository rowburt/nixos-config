{ pkgs, ... }:

{
  # Import modules we want to install
  imports = [
    ./modules/alacritty.nix
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/zsh.nix
  ];
  
  home = {
    username = "robert";
    homeDirectory = "/home/robert";
    stateVersion = "24.05";
    
    # Set default apps
    sessionVariables = {
      # TODO: EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
    
    # Install generic user packages
    packages = with pkgs; [
      # Terminal utils
      curl
      gnupg
      htop
      lm_sensors
      pinentry
      
      # Useful GNOME packages
      gnome.gnome-disk-utility
      gnome.gnome-software
      gnome.gnome-tweaks
      gnome.nautilus
      
      # Desktop apps
      deja-dup
      discord
      firefox
      mission-center
      
      # Jetbrains IDEs
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      jetbrains.clion
      jetbrains.rider
      
      # Other IDEs
      arduino
      godot_4
      rstudio
    ];
  };
}
