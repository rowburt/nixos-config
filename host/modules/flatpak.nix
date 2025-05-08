{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "org.gnome.Calculator"
      "org.gnome.clocks"
      "org.gnome.Decibels"
      "org.gnome.Loupe"
      "org.gnome.Papers"
      "org.gnome.TextEditor"
      "org.onlyoffice.desktopeditors"
    ];
  };
}
