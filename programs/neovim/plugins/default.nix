{
  blink-cmp = import ./blink-cmp.nix;
  lsp = import ./lsp.nix;
  telescope = import ./telescope.nix;
  treesitter = import ./treesitter.nix;

  lazydev.enable = true;
  todo-comments.enable = true;
  # TODO: undotree.enable = true;
  web-devicons.enable = true;
  which-key.enable = true;
}
