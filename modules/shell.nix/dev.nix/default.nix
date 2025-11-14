{ pkgs, ... }: {
  imports = [ ./python.nix ];

  environment.systemPackages = with pkgs; [ nodejs maven jdk21 ];
}
