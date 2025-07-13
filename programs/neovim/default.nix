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
    diagnostic.settings.virtual_text = true;
    globals.mapleader = " ";

    keymaps = import ./keymap.nix;
    opts = import ./options.nix;
    plugins = import ./plugins;
  };
}
