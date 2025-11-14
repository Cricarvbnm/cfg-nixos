{ pkgs, ... }:
let
  connector = "HDMI-A-1";

  edidFile = /storage/General/EDID/acer-xv273k-hdmi1;
  edidFileName = baseNameOf edidFile;
  edidDir = "lib/firmware/edid";
  edidTarget = "${edidDir}/${edidFileName}";
  edidPackage = pkgs.runCommandLocal "EDID-${edidFileName}" { } ''
    cp ${edidFile} $out
  '';
in {
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  # Virtual Monitor
  boot = {
    # initrd.extraFiles."${edidTarget}".source = edidPackage;
    kernelParams = [
      "video=${connector}:e"
      # "drm.edid_firmware=${connector}:edid/${edidFileName}"
    ];
  };
}
