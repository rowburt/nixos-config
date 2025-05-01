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
        delay_ms = 0;
        min_column = 80;
        show_commit_summary = true;
      };

      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };

      assistant = {
        enabled = false;
        button = false;
      };

      show_edit_predictions = false;
      calls.mute_on_join = true;
      diagnostics.inline.enabled = true;
      inlay_hints.enabled = true;

      icon_theme = "Catppuccin Frappé";
      theme = "Catppuccin Frappé";
      search.regex = true;
      vim_mode = false;

      ui_font_size = 20;
      buffer_font_size = 16;

      autosave.after_delay.milliseconds = 0;
      auto_update = false;
    };
  };
}
