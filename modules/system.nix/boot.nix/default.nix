{ pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;
    loader = {
      efi.canTouchEfiVariables = false;

      grub.enable = false;
      systemd-boot.enable = true;

      kernelPackages = pkgs.linuxPackages_zen;
    };
  };
}
