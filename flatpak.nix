{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    
    packages = [
      "com.github.tchx84.Flatseal"
      "org.gnome.Boxes"
      "org.gnome.Calculator"
      "org.gnome.clocks"
      "org.gnome.Evince"
      "org.gnome.Loupe"
      "org.gnome.TextEditor"
      "org.gnome.Weather"
      "org.libreoffice.LibreOffice"
    ];
  };
}
