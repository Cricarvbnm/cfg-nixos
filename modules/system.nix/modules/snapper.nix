{ config, ... }:
let
  commonConfig = {
    FSTYPE = "btrfs";

    ALLOW_USERS = [ config.mine.users.users.mainUser ];
    SYNC_ACL = true;

    NUMBER_CLEANUP = true;

    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
  };
in {
  services.snapper = {
    configs = (builtins.mapAttrs (k: v: v // commonConfig) {
      storage = { SUBVOLUME = "/storage"; };
      root = { SUBVOLUME = "/"; };
      alec = { SUBVOLUME = config.users.users.alec.home; };
    });
  };
}
