{...}: {
  imports =
    [(import ./comment-nvim.nix)]
    ++ [(import ./codeium.nix)]
    ++ [(import ./flash.nix)]
    ++ [(import ./grapple.nix)]
    ++ [(import ./hardtime.nix)]
    ++ [(import ./harpoon.nix)]
    ++ [(import ./illuminate.nix)]
    ++ [(import ./markdown-preview.nix)]
    ++ [(import ./nvim-autopairs.nix)]
    ++ [(import ./nvim-surround.nix)]
    ++ [(import ./nvim-web-devicons.nix)]
    ++ [(import ./plenary.nix)]
    ++ [(import ./tmx-navigator.nix)]
    ++ [(import ./todo-comments.nix)]
    ++ [(import ./ufo.nix)]
    ++ [(import ./undotree.nix)]
    ++ [(import ./whichkey.nix)];
}
