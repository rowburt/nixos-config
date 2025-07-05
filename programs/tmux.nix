{ ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    newSession = true;
    terminal = "screen-256color";

    extraConfig = ''
      set-option -g escape-time 50
      set-option -g focus-events on
      set-option -g renumber-windows on
      set-option -g terminal-features 'alacritty:RGB'
    '';
  };
}
