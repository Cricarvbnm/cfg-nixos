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
      options = [ "subvol=@" ];
    };

    "/boot" = {
      label = "ESP";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/var" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=@var" ];
    };

    # Nix
    "/nix" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

    # Home Alec
    "/home/alec" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=home/alec/@" ];
    };

    "/home/alec/.cache" = {
      label = "nixos";
      fsType = "btrfs";
      options = [ "subvol=home/alec/@.cache" ];
    };

    "/home/alec/tmp" = { fsType = "tmpfs"; };

    # Storage
    "/storage" = {
      label = "storage";
      fsType = "btrfs";
      options = [ "subvol=@" "x-gvfs-trash" ];
    };

    "/storage/.snapshots" = {
      label = "storage";
      fsType = "btrfs";
      options = [ "subvol=@.snapshots" ];
    };
  };

  # Swap
  swapDevices = [ ];
}
