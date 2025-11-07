{ config, lib, ... }:

{
  imports = [ <nixos-hardware/asus/fx506hm> ];

  # Intel iGPU
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "i915.enable_guc=3" ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Others
  boot.initrd.availableKernelModules =
    [ "vmd" "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

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

    "home/alec/tmp" = { fsType = "tmpfs"; };

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

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp108s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
