{ ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    newSession = true;
    terminal = "screen-256color";

    extraConfig = ''
      set-option -g renumber-windows on
    '';
  };
}
