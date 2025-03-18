{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "com.github.tchx84.Flatseal"
      "io.github.zen_browser.zen"
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
