{ pkgs, ... }:

{
  programs.zed-editor = {
    extensions = [
      # "csharp"
      "csv"
      "http"
      "java"
      "kotlin"
      "neocmake"
      "nix"
      "sql"
      "toml"
      "xml"
    ];

    extraPackages = with pkgs; [
      clang-tools
      cmake
      gradle
      neocmakelsp
      nixd
      nil
    ];
  };
}
