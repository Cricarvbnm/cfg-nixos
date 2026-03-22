{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./editor.nix
    ./shell.nix
    ./de.nix
    ./nix.nix
    ./proxy.nix
    ./dev.nix
  ];

  system.stateVersion = "25.11";

  nixpkgs.config = {
    allowUnfree = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services.udev.extraHwdb = ''
    # Embedded keyboard mapping
    evdev:atkbd:dmi:*
      KEYBOARD_KEY_3a=leftctrl # capslock
      KEYBOARD_KEY_01=capslock # esc
      KEYBOARD_KEY_1d=esc # left ctrl
  '';

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          kdePackages.fcitx5-chinese-addons
          fcitx5-pinyin-zhwiki
        ];
        settings = {
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIm = "pinyin";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
              Layout = "";
            };
            "Groups/0/Items/1" = {
              Name = "pinyin";
              Layout = "";
            };
          };
        };
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      sarasa-gothic
      nerd-fonts.symbols-only
    ];

    fontconfig.defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Sarasa Fixed SC"
        "Symbols Nerd Font"
      ];
      sansSerif = [ "Noto Sans CJK SC" ];
      serif = [ "Noto Serif CJK SC" ];
    };
  };

  time.timeZone = "Asia/Shanghai";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  security.sudo.wheelNeedsPassword = false;

  users.users.alechron = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Networking
  networking = {
    hostName = "alec-nixos";
    networkmanager.enable = true;
  };
  users.groups.networkmanager.members = [ "alechron" ];

  services = {
    # SSH
    openssh = {
      enable = true;
      openFirewall = true;
    };

    # mDNS
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

  # Programs
  environment.systemPackages = with pkgs; [
    tree
    curl
    iftop
  ];
  programs = {
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "alechron";
          email = "alechron@outlook.com";
        };
        url = {
          "https://github.com/".insteadOf = [ "github:" ];
        };
        safe.directory = [ "/etc/nixos" ];

        alias = {
          s = "status --short";
          a = "add";
          aa = "add --all";
          c = "commit";
          cu = "commit --amend";
        };
      };
    };
    less = {
      enable = true;
      envVariables = {
        LESS = "-R --ignore-case";
      };
    };
  };
}
