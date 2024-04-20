{...}: {
  imports =
    [(import ./neo-tree.nix)]
    ++ [(import ./oil.nix)];
}
