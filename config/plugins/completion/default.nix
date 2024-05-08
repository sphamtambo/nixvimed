{...}: {
  imports =
    [(import ./cmp.nix)]
    ++ [(import ./lspkind.nix)];
}
