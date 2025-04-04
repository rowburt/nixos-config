{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "org.cvfosammmm.Setzer"
      "org.gnome.Calculator"
      "org.gnome.clocks"
      "org.gnome.Loupe"
      "org.gnome.Papers"
      "org.gnome.TextEditor"
      "org.onlyoffice.desktopeditors"
    ];
  };
}
