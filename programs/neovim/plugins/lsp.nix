{
  enable = true;

  keymaps = {
    lspBuf = {
      gd = "definition";
      gr = "references";
      gk = "hover";
    };
  };

  # TODO: Configure LSPs
  servers = {
    dartls.enable = true;
    jsonls.enable = true;
    kotlin_language_server.enable = true;
    lua_ls.enable = true;
    nixd.enable = true;
    pyright.enable = true;
    ts_ls.enable = true;

    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      installRustfmt = true;
    };
  };
}
