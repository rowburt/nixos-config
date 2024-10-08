{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    
    packages = [
      "com.github.tchx84.Flatseal"
      "com.jetbrains.Rider"
      "org.cvfosammmm.Setzer"
      "org.gnome.Calculator"
      "org.gnome.clocks"
      "org.gnome.Evince"
      "org.gnome.Loupe"
      "org.gnome.TextEditor"
      "org.onlyoffice.desktopeditors"
    ];
  };
}
