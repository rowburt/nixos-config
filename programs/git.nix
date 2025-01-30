{ ... }:

{
  programs.git = {
    enable = true;
    userName = "rowburt";
    userEmail = "32477930+rowburt@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";

    signing = {
      key = "A406A7AD63012D0D";
      signByDefault = true;
    };
  };
}
