{ pkgs, config, lib, ... }: {
  boot = {
    consoleLogLevel = 3;
    loader = {
      efi.canTouchEfiVariables = true;

      grub.enable = false;
      refind = let
        inherit (builtins)
          attrNames readDir listToAttrs filter match replaceStrings;

        iconDirPath = "${config.boot.loader.refind.package}/share/refind/icons";

        iconFilenames = attrNames (readDir iconDirPath);

        iconAdditionalFiles = listToAttrs (map (v: {
          name = "icons/${v}";
          value = "${iconDirPath}/${v}";
        }) iconFilenames);

        themeDir = ./rEFInd-tokyo-night;
        themeName = "${baseNameOf themeDir}";
        themeFilename = "theme.conf";

        themeTargetDir = "themes/${themeName}";
        themeFilePaths = lib.filesystem.listFilesRecursive themeDir;
        themeFileRelativePaths = map (path:
          replaceStrings [ ((toString themeDir) + "/") ] [ "" ] (toString path))
          themeFilePaths;
        themeFiles = themeFileRelativePaths;

        themeAdditionalFiles = listToAttrs (map (v: {
          name = "${themeTargetDir}/${v}";
          value = "${themeDir}/${v}";
        }) themeFiles);
      in {
        enable = true;
        extraConfig = ''
          use_nvram false

          resolution max

          scan_all_linux_kernels false

          extra_kernel_version_strings linux-lts,linux-zen,linux-g14,linux

          menuentry "ARCH-FX607JVR" {
              icon    /EFI/refind/icons/os_arch.png
              volume  ESP
              loader  vmlinuz-linux-g14
              initrd  initramfs-linux-g14.img
              options "root=LABEL=ARCH-FX607JVR rootflags=subvol=@ initrd=intel-ucode.img rw add_efi_memmap ibt=off loglevel=3 nowatchdog drm.edid_firmware=HDMI-A-2:edid/acer-xv273k-hdmi1 video=HDMI-A-2:e modprobe.blacklist=iTCO_wdt,nvidia,nouveau intel_iommu=on iommu=pt"

              submenuentry "NVIDIA (no vfio)" {
                  options "root=LABEL=ARCH-FX607JVR rootflags=subvol=@ initrd=intel-ucode.img rw add_efi_memmap ibt=off loglevel=3 nowatchdog drm.edid_firmware=HDMI-A-2:edid/acer-xv273k-hdmi1 video=HDMI-A-2:e modprobe.blacklist=iTCO_wdt,vfio_pci,vfio,vfio_iommu_type1 nvidia_drm.modeset=1 nvidia_drm.fbdev=1"
              }

              submenuentry "fallback initramfs" {
          	    initrd initramfs-linux-g14-fallback.img
              }
          }

          # theme
          include ${themeTargetDir}/${themeFilename}
        '';
        additionalFiles = iconAdditionalFiles // themeAdditionalFiles;
      };
    };

    kernelPackages = pkgs.linuxPackages_zen;
  };
}
