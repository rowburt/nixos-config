{
  enable = true;

  # https://nix-community.github.io/nixvim/plugins/lazydev/index.html
  settings.sources.providers = {
    lazydev = {
      name = "LazyDev";
      module = "lazydev.integrations.blink";
      score_offset = 100;
    };
  };
}

