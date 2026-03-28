{
  imports = [
    ./i18n.nix
    ./fonts.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
