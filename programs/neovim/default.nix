{ nixvim, ... }:

{
  imports = [ nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfigLua = builtins.readFile ./options.lua;

    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    colorschemes.catppuccin = {
      enable = true;
      autoLoad = true;
      settings.flavour = "mocha";
    };

    dependencies = {
      ripgrep.enable = true;
    };

    plugins = {
      telescope.enable = true;
      todo-comments.enable = true;
      treesitter.enable = true;
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
    };
  };
}
