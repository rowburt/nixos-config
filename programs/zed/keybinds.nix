{ ... }:

{
  programs.zed-editor = {
    userSettings.base_keymap = "None";

    userKeymaps = [
      {
        bindings = {
          # Execute 'run' in the terminal
          # Run is an alias provided by nix flake
          ctrl-e = [
            "workspace::SendKeystrokes"
            "ctrl-1 ctrl-c run enter ctrl-1"
          ];

          ctrl-alt-o = "projects::OpenRecent";
          f11 = "zed::ToggleFullScreen";
          ctrl-w = "pane::CloseActiveItem";
          escape = "menu::Cancel";
          enter = "menu::Confirm";
        };
      }

      {
        context = "Workspace && !Terminal";
        bindings = {
          # Execute 'run' in the terminal
          # Run is an alias provided by nix flake
          ctrl-e = [
            "workspace::SendKeystrokes"
            "ctrl-1 ctrl-c run enter ctrl-1"
          ];
        };
      }

      {
        context = "Terminal";
        bindings = {
          # Execute 'run' in the terminal
          # Run is an alias provided by nix flake
          ctrl-e = [
            "workspace::SendKeystrokes"
            "ctrl-c run enter"
          ];
        };
      }

      {
        context = "Editor && mode == full";
        bindings = {
          enter = "editor::Newline";
          ctrl-alt-l = "editor::Format";
        };
      }

      {
        context = "BufferSearchBar";
        bindings = {
          enter = "search::SelectNextMatch";
          shift-enter = "search::SelectPrevMatch";
        };
      }

      {
        # TODO: Add refactor ctrl alt L keybind
        context = "Editor";
        bindings = {
          up = "editor::MoveUp";
          down = "editor::MoveDown";
          left = "editor::MoveLeft";
          right = "editor::MoveRight";
          ctrl-left = "editor::MoveToPreviousSubwordStart";
          ctrl-right = "editor::MoveToNextSubwordEnd";
          escape = "editor::Cancel";

          shift-up = "editor::SelectUp";
          shift-down = "editor::SelectDown";
          shift-left = "editor::SelectLeft";
          shift-right = "editor::SelectRight";
          ctrl-shift-left = "editor::SelectToPreviousSubwordStart";
          ctrl-shift-right = "editor::SelectToNextSubwordEnd";
          ctrl-shift-up = "editor::SelectPrevious";
          ctrl-shift-down = "editor::SelectNext";

          ctrl-backspace = "editor::DeleteToPreviousSubwordStart";
          backspace = "editor::Backspace";
          ctrl-delete = "editor::DeleteToNextSubwordEnd";
          delete = "editor::Delete";
          tab = "editor::Tab";

          ctrl-a = "editor::SelectAll";
          ctrl-c = "editor::Copy";
          ctrl-x = "editor::Cut";
          ctrl-v = "editor::Paste";

          ctrl-z = "editor::Undo";
          ctrl-shift-z = "editor::Redo";

          ctrl-f = "buffer_search::Deploy";
          alt-f = "editor::SelectAllMatches";
          "ctrl-/" = [
            "editor::ToggleComments"
            {
              "advance_downwards" = true;
            }
          ];
        };
      }

      {
        context = "Picker || menu";
        bindings = {
          up = "menu::SelectPrev";
          down = "menu::SelectNext";
          ctrl-enter = "menu::SecondaryConfirm";
        };
      }

      {
        context = "Workspace";
        bindings = {
          ctrl-t = "workspace::NewFile";
          ctrl-1 = "terminal_panel::ToggleFocus";
          ctrl-d = "file_finder::Toggle";
          ctrl-alt-d = "outline::Toggle";
          ctrl-shift-d = "command_palette::Toggle";
          ctrl-shift-f = "pane::DeploySearch";
        };
      }

      {
        context = "Pane";
        bindings = {
          ctrl-alt-left = "pane::GoBack";
          ctrl-alt-right = "pane::GoForward";
        };
      }

      {
        context = "ProjectPanel";
        bindings.delete = "project_panel::Trash";
      }
    ];
  };
}
