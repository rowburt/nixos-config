{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      # "csharp"
      "csv"
      "dart"
      "git-firefly"
      "java"
      "just"
      "kotlin"
      "latex"
      "lua"
      "nix"
      "sql"
      "toml"
      "xml"
      "zig"
    ];

    extraPackages = with pkgs; [
      ktfmt
      lua-language-server
      nixd
      nixfmt-rfc-style
      package-version-server
      rust-analyzer
    ];

    userSettings = {
      lsp = {
        dart.options.lineLength = 140;

        kotlin-language-server.settings = {
          # https://github.com/fwcd/kotlin-language-server/blob/main/server/src/main/kotlin/org/javacs/kt/Configuration.kt
          inlayHints = {
            typeHints = true;
            parameterHints = true;
            chainedHints = true;
          };

          formatting.ktfmt.maxWidth = 140;
        };

        lua-language-server = {
          binary.path = lib.getExe pkgs.lua-language-server;
        };

        nixd = {
          formatting.command = [ "nixfmt" ];
          options.autoArchive = true;
        };

        package-version-server = {
          binary.path = lib.getExe pkgs.package-version-server;
        };

        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
        };
      };

      languages = {
        Lua = {
          format_on_save = "on";
          formatter = "language_server";
        };

        # Only use nixd for nix files
        Nix.language_servers = [
          "nixd"
          "!nil"
        ];
      };
    };
  };
}
