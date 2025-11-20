{ pkgs, ... }: {
  imports = [ ./python.nix ./frontend.nix ./java.nix ];

  environment.systemPackages = with pkgs; [ gcc ];
}
