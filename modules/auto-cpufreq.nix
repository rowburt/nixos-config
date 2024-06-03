{ ... }:

{
  programs.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "ondemand";
        turbo = "auto";
      };
      
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };
}
