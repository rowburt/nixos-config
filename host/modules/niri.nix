{ ... }:

{
  services = {
    displayManager = {
      defaultSession = "niri";

      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  programs.niri.enable = true;
}
