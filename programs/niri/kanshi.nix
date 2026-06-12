{ ... }:

{
  services.kanshi = {
    enable = true;

    profiles = {
      undocked.outputs = [
        {
          criteria = "eDP-1";
          mode = "1920x1080@60";
          position = "0,0";
          scale = 1.2;
          status = "enable";
        }
      ];

      docked.outputs = [
        {
          criteria = "eDP-1";
          status = "disable";
        }
        {
          criteria = "LG Electronics 27GL850 911NTQD23220";
          mode = "2560x1440@144";
          scale = 1.0;
          status = "enable";
        }
      ];
      
      fallback.outputs = [
        {
          criteria = "*";
          status = "enable";
        }
      ];
    };
  };
}
