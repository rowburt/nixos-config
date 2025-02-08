{ ... }:

{
  imports = [
    ./extensions.nix
    ./keybinds.nix
  ];

  programs.zed-editor = {
    enable = true;

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      tabs = {
        file_icons = true;
        git_status = true;
      };

      git.inline_blame = {
        enabled = true;
        delay_ms = 500;
        min_column = 80;
        show_commit_summary = true;
      };

      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };

      # TODO: Colorful icon theme
      theme = "Andromeda";
      search.regex = true;
      vim_mode = false;

      ui_font_size = 20;
      buffer_font_size = 16;

      autosave.after_delay.milliseconds = 0;
      auto_update = false;
    };
  };
}
