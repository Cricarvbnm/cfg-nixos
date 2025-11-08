{ lib, config, ... }:
let inherit (lib) mkDefault;
in {
  imports = [ <nixos-hardware/asus/fx506hm> ];

  nixpkgs.hostPlatform = mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    mkDefault config.hardware.enableRedistributableFirmware;

  # Intel iGPU
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "i915.enable_guc=3" ];

  # Bluetooth
  hardware.bluetooth.enable = mkDefault true;

  # Networking
  networking.useDHCP = mkDefault true;

  # Boot
  boot = {
    initrd = {
      availableKernelModules = [
        "vmd"
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  # FileSystems
  fileSystems = {
    # System
    "/" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" ];
    };

    "/boot" = {
      label = "ESP";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/var" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=@var" "compress=zstd" ];
    };

    # Nix
    "/nix" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

    # Home Alec
    "/home/alec" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=home/alec/@" "compress=zstd" ];
    };

    "/home/alec/.cache" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=home/alec/@.cache" "compress=zstd" ];
    };

    "/home/alec/tmp" = { fsType = "tmpfs"; };

    # Storage
    "/storage" = {
      label = "storage";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "x-gvfs-trash" ];
    };

    "/storage/.snapshots" = {
      label = "storage";
      fsType = "btrfs";
      options = [ "subvol=@.snapshots" "compress=zstd" ];
    };
  };

  # Swap
  swapDevices = [ ];
}
