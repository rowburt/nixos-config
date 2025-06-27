{ ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    newSession = true;
    terminal = "alacritty";

    extraConfig = ''
      set-option -g escape-time 50
      set-option -g focus-events on
      set-option -g renumber-windows on
    '';
  };
}
