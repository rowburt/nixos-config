{ ... }:

{
  services.kanshi = {
    enable = true;

    settings = [
      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
              mode = "2880x1920@120";
              position = "0,0";
              adaptiveSync = true;
              scale = 1.8;
              status = "enable";
            }
          ];
        };
      }

      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "LG Electronics 27GL850 911NTQD23220";
              mode = "2560x1440@120";
              adaptiveSync = true;
              scale = 1.0;
              status = "enable";
            }
          ];
        };
      }

      {
        profile = {
          name = "fallback";
          outputs = [
            {
              criteria = "*";
              status = "enable";
            }
          ];
        };
      }
    ];
  };
}
