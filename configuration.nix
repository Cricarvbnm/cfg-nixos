{
  imports = [
    ./hardware-configuration.nix
    ./core.nix
    ./users.nix
    ./network.nix
    ./programs.nix
    ./desktop.nix
    ./shell.nix
    ./editor.nix
    ./dev.nix
    ./nix.nix
  ];

  system.stateVersion = "25.11";

  services = {
    udev.extraHwdb = ''
      evdev:atkbd:dmi:*
        KEYBOARD_KEY_3a=leftctrl # Capslock
        KEYBOARD_KEY_01=capslock # ESC
        KEYBOARD_KEY_1d=esc # LeftCtrl
    '';

    logind.settings.Login.HandleLidSwitch = "ignore";

    openssh = {
      enable = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };
  };

  boot.kernel.sysctl."vm.swappiness" = 10;
}
