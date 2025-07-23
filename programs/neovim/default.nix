{ nixvim, ... }:

{
  imports = [ nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    colorschemes.catppuccin = {
      enable = true;
      autoLoad = true;
      settings.flavour = "mocha";
    };

    dependencies.ripgrep.enable = true;
    globals.mapleader = " ";

    diagnostic.settings = {
      virtual_lines.current_line = true;
      virtual_text = false;
      update_in_insert = true;
    };

    keymaps = import ./keymap.nix;
    opts = import ./options.nix;
    plugins = import ./plugins;
  };
}
