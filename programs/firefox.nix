{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
    };
  };
}