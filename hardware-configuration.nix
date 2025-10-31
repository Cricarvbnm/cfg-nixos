{ config, lib, inputs, pkgs, ... }:

{
  imports = [ inputs.nixos-hardware.nixosModules.asus-fx506hm ];

  boot.initrd.availableKernelModules =
    [ "vmd" "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a3417677-b806-4581-aba1-6033792a24c5";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6C2B-1A50";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/home/alec" = {
    device = "/dev/disk/by-uuid/a3417677-b806-4581-aba1-6033792a24c5";
    fsType = "btrfs";
    options = [ "subvol=home/alec/@" ];
  };

  fileSystems."/home/alec/.cache" = {
    device = "/dev/disk/by-uuid/a3417677-b806-4581-aba1-6033792a24c5";
    fsType = "btrfs";
    options = [ "subvol=home/alec/@.cache" ];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/a3417677-b806-4581-aba1-6033792a24c5";
    fsType = "btrfs";
    options = [ "subvol=@var" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/a3417677-b806-4581-aba1-6033792a24c5";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
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
