{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
      update = "(cd /etc/nixos/ && sudo nix flake update) && rebuild";
    };
    
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" ];
    };
  };
}
