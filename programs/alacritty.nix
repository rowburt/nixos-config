{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      selection.save_to_clipboard = true;

      window = {
        opacity = 0.85;
        startup_mode = "Maximized";
      };

      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };

      keyboard.bindings = [
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }

        {
          key = "ArrowUp";
          mods = "Control";
          action = "ScrollHalfPageUp";
        }
        {
          key = "ArrowDown";
          mods = "Control";
          action = "ScrollHalfPageDown";
        }
        {
          key = "PageUp";
          action = "ScrollToTop";
        }
        {
          key = "PageDown";
          action = "ScrollToBottom";
        }

        {
          key = "F11";
          action = "ToggleMaximized";
        }
      ];
    };
  };
}
