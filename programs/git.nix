{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";

      user = {
        name = "rowburt";
        email = "32477930+rowburt@users.noreply.github.com";
      };
    };

    signing = {
      key = "A406A7AD63012D0D";
      signByDefault = true;
    };
  };
}
