{ config, ... }: {
  virtualisation.docker = { enable = true; };
  users.groups.docker.members = [ config.mine.users.users.mainUser ];
}
