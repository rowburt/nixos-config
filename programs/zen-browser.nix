{ zen-browser, ... }:

{
  imports = [ zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
    };
  };
}
