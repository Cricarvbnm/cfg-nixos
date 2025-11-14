{ config, lib, ... }:
let mainUser = "alec";
in {
  options.mine.users.users = (let
    inherit (lib.options) mkOption;
    inherit (lib) literalMD;
    inherit (lib.types) str;
  in {
    mainUser = mkOption {
      default = null;
      description = literalMD ''
        The main username of this host. `null` for no this user.
      '';
      type = str;
    };
  });

  config = {
    mine.users.users.mainUser = mainUser;

    users.users = {
      ${mainUser} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };

    security.sudo.wheelNeedsPassword = false;
  };
}
