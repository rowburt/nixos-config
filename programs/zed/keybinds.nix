{ ... }:

{
  programs.zed-editor = {
    userSettings.base_keymap = "None";

    # TODO: file delete dialog navigation and find everywhere goto
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
        context = "BufferSearchBar";
        bindings = {
          enter = "search::SelectNextMatch";
          shift-enter = "search::SelectPrevMatch";
        };
      }

      {
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
          ctrl-space = "editor::ShowCompletions";

          ctrl-z = "editor::Undo";
          ctrl-shift-z = "editor::Redo";

          ctrl-f = "buffer_search::Deploy";
          alt-f = "editor::SelectAllMatches";
          ctrl-enter = "editor::GoToDefinition";
          "ctrl-/" = [
            "editor::ToggleComments"
            {
              "advance_downwards" = true;
            }
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
        context = "Editor && showing_completions";
        bindings = {
          enter = "editor::ConfirmCompletion";
          tab = "editor::ComposeCompletion";
          up = "editor::ContextMenuPrev";
          down = "editor::ContextMenuNext";
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
          ctrl-d = "outline::Toggle";
          ctrl-alt-d = "command_palette::Toggle";
          ctrl-shift-d = "file_finder::Toggle";
          ctrl-shift-f = "pane::DeploySearch";
        };
      }

      {
        context = "Pane";
        bindings = {
          ctrl-alt-left = "pane::ActivatePrevItem";
          ctrl-alt-right = "pane::ActivateNextItem";
        };
      }

      {
        context = "ProjectPanel";
        bindings.delete = "project_panel::Trash";
      }
    ];
  };
}
