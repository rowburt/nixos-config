{
  blink-cmp = {
    enable = true;

    # https://nix-community.github.io/nixvim/plugins/lazydev/index.html
    settings.sources.providers = {
      lazydev = {
        name = "LazyDev";
        module = "lazydev.integrations.blink";
        score_offset = 100;
      };
    };
  };

  lazydev.enable = true;
  telescope.enable = true;
  todo-comments.enable = true;
  # TODO: undotree.enable = true;
  web-devicons.enable = true;
  which-key.enable = true;

  lsp = {
    enable = true;

    # TODO: Configure LSPs
    servers = {
      dartls.enable = true;
      kotlin_language_server.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      pyright.enable = true;

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        installRustfmt = true;
      };
    };
  };

  treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
    };
  };
}
