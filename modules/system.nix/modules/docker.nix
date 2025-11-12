{ config, pkgs, ... }: {
  virtualisation.docker = { enable = true; };
  users.groups.docker.members = [ config.mine.users.users.mainUser ];

  environment.systemPackages = with pkgs; [ docker-compose ];
}
