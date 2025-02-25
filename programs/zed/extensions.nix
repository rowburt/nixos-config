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
      "kotlin"
      "latex"
      "neocmake"
      "nix"
      "qml"
      "sql"
      "toml"
      "xml"
      "zig"
    ];

    extraPackages = with pkgs; [
      cargo
      clang-tools
      cmake
      gradle
      kdePackages.qtdeclarative
      ktfmt
      neocmakelsp
      nixd
      nixfmt-rfc-style
      rust-analyzer
      rustc
      rustfmt
      zig
    ];

    userSettings = {
      lsp = {
        clangd.arguments = [
          "-background-index"
          "-compile-commands-dir=build"
        ];

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

        nixd = {
          formatting.command = [ "nixfmt" ];
          options.autoArchive = true;
        };

        rust-analyzer = {
          binary.path = lib.getExe pkgs.rust-analyzer;
        };
      };

      languages = {
        # Only use nixd for nix files
        Nix.language_servers = [
          "nixd"
          "!nil"
        ];
      };

      file_types = {
        CMake = [ "CMakeLists.txt" ];
      };
    };
  };
}
