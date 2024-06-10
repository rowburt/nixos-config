{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };

      keyboard.bindings = [
        { key = "T"; mods = "Control"; action = "CreateNewWindow"; }
        { key = "W"; mods = "Control"; action = "Quit"; }
        
        { key = "C"; mods = "Control|Shift"; action = "Copy"; }
        { key = "V"; mods = "Control|Shift"; action = "Paste"; }
        
        { key = "ArrowUp"; mods = "Control"; action = "ScrollHalfPageUp"; }
        { key = "ArrowDown"; mods = "Control"; action = "ScrollHalfPageDown"; }
        { key = "PageUp"; action = "ScrollToTop"; }
        { key = "PageDown"; action = "ScrollToBottom"; }
         
        { key = "F11"; action = "ToggleMaximized"; }
      ];
    };
  };
}

