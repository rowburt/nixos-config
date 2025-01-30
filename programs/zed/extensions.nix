{ pkgs, ... }:

{
  programs.zed-editor = {
    extensions = [
      # "csharp"
      "csv"
      "dart"
      # "haskell"
      "http"
      "java"
      "kotlin"
      "neocmake"
      "nix"
      "qml"
      "sql"
      "toml"
      "xml"
    ];

    extraPackages = with pkgs; [
      clang-tools
      cmake
      gradle
      kdePackages.qtdeclarative
      ktfmt
      neocmakelsp
      nixd
      nixfmt-rfc-style
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

        # TODO: Configure language servers
        nixd = {
          formatting.command = [ "nixfmt" ];
          options.autoArchive = true;
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
