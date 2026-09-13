{ noctalia, pkgs, ... }:

{
  imports = [
    noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;
  };
}

