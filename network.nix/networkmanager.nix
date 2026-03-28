{ config, ... }:
{
  networking = {
    networkmanager.enable = true;
  };

  users.groups.networkmanager.members = [ config._module.args.mainUser ];
}
