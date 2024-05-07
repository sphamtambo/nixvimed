{
  description = "Nixvim Configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    # nixpkgs = {
    #   url = "github:nixos/nixpkgs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs: let
    config = import ./config;
  in
    flake-utils.lib.eachDefaultSystem (system: let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs {inherit system;};
      # pkgs = import nixpkgs {
      #   inherit system;
      #   config = {
      #     allowBroken = true;
      #     allowUnfree = true;
      #   };
      # };
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
        extraSpecialArgs = {
          inherit self;
        };
      };
    in {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "nixvim config";
        };
      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };

      formatter = pkgs.alejandra;
    });
}
