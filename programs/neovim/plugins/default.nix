{
  blink-cmp = import ./blink-cmp.nix;
  lsp = import ./lsp.nix;
  telescope = import ./telescope.nix;
  todo-comments = import ./todo-comments.nix;
  treesitter = import ./treesitter.nix;

  lazydev.enable = true;
  lsp-format.enable = true;
  # TODO: undotree.enable = true;
  web-devicons.enable = true;
  which-key.enable = true;
}
