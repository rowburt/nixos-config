{ ... }:

{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    colorschemes.rose-pine = {
      enable = true;
      settings = {
        dim_inactive_windows = true;
        variant = "moon";
      };
    };

    opts = {
      # Start scrolling when specified amount of lines away from border
      scrolloff = 4;

      # Line numbering
      number = true;
      relativenumber = true;

      # Highlight current line
      cursorline = true;

      # Tab settings
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;

      # Search
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      ruler = true;
    };

    keymaps = [
      {
        key = "<A-w>";
        action = "<cmd>:w<CR>";
        mode = [
          "n"
          "i"
        ];
        options = {
          desc = "Save file";
          nowait = true;
        };
      }
      {
        key = "<A-q>";
        action = "<cmd>:q<CR>";
        options = {
          desc = "Close neovim";
          nowait = true;
        };
      }

      {
        key = "<A-e>";
        action = "<cmd>:bprev<CR>";
        mode = [
          "n"
          "i"
        ];
        options = {
          desc = "Move to previous file";
          nowait = true;
        };
      }
      {
        key = "<A-r>";
        action = "<cmd>:bnext<CR>";
        mode = [
          "n"
          "i"
        ];
        options = {
          desc = "Move to next file";
          nowait = true;
        };
      }
    ];

    plugins = {
      treesitter.enable = true;
      undotree.enable = true;

      cmp = {
        # TODO: Fix
        enable = true;

        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Esc>" = "cmp.mapping.abort()";
          };
        };
      };

      telescope = {
        enable = true;

        keymaps = {
          "<A-f>" = {
            action = "live_grep";
            options.desc = "Project-wide search";
          };

          "<A-t>" = {
            action = "buffers";
            options.desc = "Open recent files finder";
          };

          "<A-p>" = {
            action = "find_files";
            options.desc = "Open file finder";
          };
        };
      };

      lsp = {
        enable = true;

        servers = {
          bashls.enable = true;
          cmake.enable = true;
          csharp_ls.enable = true;
          cssls.enable = true;
          dartls.enable = true;
          dockerls.enable = true;
          gopls.enable = true;
          html.enable = true;
          java_language_server.enable = true;
          jsonls.enable = true;
          kotlin_language_server.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          sqls.enable = true;

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
    };
  };
}
