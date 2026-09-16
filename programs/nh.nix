{ ... }: {

  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 21d --keep 3 --keep-one --optimise";
    };
  };
}
