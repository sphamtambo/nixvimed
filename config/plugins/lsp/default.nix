{...}: {
  imports =
    [(import ./conform.nix)]
    ++ [(import ./fidget.nix)]
    ++ [(import ./hlchunk.nix)]
    ++ [(import ./lint.nix)]
    ++ [(import ./lsp.nix)]
    ++ [(import ./lspsaga.nix)]
    ++ [(import ./trouble.nix)];
}
