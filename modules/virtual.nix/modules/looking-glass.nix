{ config, pkgs, ... }:
let shmSize = 64;
in {
  boot = {
    # Add kvmfr to replace the shared memory
    extraModulePackages = [ config.boot.kernelPackages.kvmfr ];
    kernelModules = [ "kvmfr" ];
    extraModprobeConfig = ''
      options kvmfr static_size_mb=${toString shmSize}
    '';
  };

  # Change owner of /dev/kvmfr0 to allow alec to use
  services.udev.extraRules = ''
    SUBSYSTEM=="kvmfr", OWNER="alec", GROUP="kvm", MODE="0660"
  '';

  # VM will use this devices, including kvmfr
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    cgroup_device_acl = [
      "/dev/null", "/dev/full", "/dev/zero",
      "/dev/random", "/dev/urandom",
      "/dev/ptmx", "/dev/kvm",
      "/dev/kvmfr0"
    ]
  '';

  # Add looking-glass-client
  environment.systemPackages = [ pkgs.looking-glass-client ];
}
