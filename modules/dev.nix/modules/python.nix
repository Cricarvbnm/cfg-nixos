{ pkgs, ... }: {
  # uv
  environment.systemPackages = with pkgs; [ uv ];
  programs.nix-ld.enable = true;
}
