{
  enable = true;

  settings = {
    # https://nix-community.github.io/nixvim/plugins/lazydev/index.html
    sources.providers.lazydev = {
      name = "LazyDev";
      module = "lazydev.integrations.blink";
      score_offset = 100;
    };

    keymap = {
      preset = "default";
      "<C-j>" = ["select_next" "fallback"];
      "<C-k>" = ["select_prev" "fallback"];
      "<CR>" = ["select_and_accept" "fallback"];
    };
  };
}

