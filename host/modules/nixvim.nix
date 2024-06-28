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
        mode = [ "n" "i" ];
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
        mode = [ "n" "i" ];
        options = {
          desc = "Move to previous file";
          nowait = true;
        };
      }
      {
        key = "<A-r>";
        action = "<cmd>:bnext<CR>";
        mode = [ "n" "i" ];
        options = {
          desc = "Move to next file";
          nowait = true;
        };
      }
    ];
    
    plugins = {
      treesitter.enable = true;
      undotree.enable = true;

      telescope = {
        enable = true;

        keymaps = {
          "<A-t>" = {
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
          csharp-ls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          html.enable = true;
          java-language-server.enable = true;
          jsonls.enable = true;
          kotlin-language-server.enable = true;
          lua-ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          sqls.enable = true;

          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
    };
  };
}

