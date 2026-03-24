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
      format = "openpgp";
      key = "A406A7AD63012D0D";
      signByDefault = true;
    };
  };
}
