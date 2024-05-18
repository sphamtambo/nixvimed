{pkgs, ...}: {
  extraPackages = with pkgs; [
    cargo-nextest
  ];
}
