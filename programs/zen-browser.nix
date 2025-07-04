{ zen-browser, ... }:

{
  imports = [ zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
    };
  };
}
