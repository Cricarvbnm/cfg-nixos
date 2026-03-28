{ pkgs, config, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  # NH
  environment = {
    sessionVariables = {
      NH_OS_FLAKE = "/etc/nixos#nixosConfigurations.${config.networking.hostName}";
    };
    systemPackages = with pkgs; [ nh ];
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
