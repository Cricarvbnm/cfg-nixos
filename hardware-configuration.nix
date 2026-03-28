{
  config,
  lib,
  inputs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x260
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  services.libinput.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b91fe3f2-5a30-4b69-9406-b06bfc6949e0";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
      ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/b91fe3f2-5a30-4b69-9406-b06bfc6949e0";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };
    "/var" = {
      device = "/dev/disk/by-uuid/b91fe3f2-5a30-4b69-9406-b06bfc6949e0";
      fsType = "btrfs";
      options = [ "subvol=@var" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/b91fe3f2-5a30-4b69-9406-b06bfc6949e0";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "noatime"
      ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/382A-0243";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
    "/swap" = {
      device = "/dev/disk/by-uuid/b91fe3f2-5a30-4b69-9406-b06bfc6949e0";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
