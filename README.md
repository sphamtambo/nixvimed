# nixvimed

`nixvimed` is a Nix Flake for managing Neovim configuration using [nixvim](.https://github.com/nix-community/nixvim).
It provides a reproducible and declarative way to set up your Neovim environment across different machines and environments.

## Features

- **LSP Support:** Language Server Protocol (LSP) support for code completion, hover information, and diagnostics across various programming languages, ensuring a consistent development experience.

- **Linters and Formatters:** Simplified management of Neovim plugins for linters and code formatters, facilitating code quality checks and consistent code formatting.

- **Debugging and Testing:** Declarative configuration with Nix expressions enables easy setup of debugging tools and testing frameworks tailored to your specific needs.

- **Code Completion and Snippets:** Enhance coding speed and accuracy with features like code completion and snippets, aiding in writing code faster and with fewer errors.

- **Git Management:** Perform common Git operations directly within Neovim, such as committing changes, viewing diffs, and navigating through commit history, streamlining your workflow.

- **Enhanced UI and Utilities:** Customize the Neovim user interface with themes, statusline configurations, and additional utilities to personalize your editing experience and improve productivity.

## Getting Started

### Prerequisites

To use `nixvimed`, you need to have Nix installed on your system. You can install Nix by following the instructions on the [Nix website](https://nixos.org/download.html).
Once your nix is installed on your system, enable flake support by adding the
followint line for your nix.conf file. `~/.config/nix/nix.conf`.

```nix
experimental-features = nix-command flakes
```

### Installation

#### Method 1

To use `nixvimed` in your Neovim setup, you can add it as a Flake input in your `flake.nix` file:

```nix
inputs.nixvimed.url = "github:sphamtambo/nixvimed";
```

Followed by adding the `nixvimed` to your system configuration:

Via home-manager:

```nix
{
  inputs,
  system,
  ...
}: {
  home.packages =  [
    inputs.nixvimed.packages.${system}.default
  ];
}
```

Via NixOS;

```nix
{
  inputs,
  system,
  ...
}: {
  environment.systemPackages =  [
    inputs.nixvimed.packages.${system}.default
  ];
}
```

As an Overlay

```
{inputs, ...}: {
  overlays = final: prev: {
    neovim = inputs.nixvimed.packages.${prev.system}.default;
  };
}

```

#### Method 2

Alternatively you can run `nixvimed` via the following command:

```nixos
nix run 'github:sphamtambo/nixvimed'
```
