{ ... }: {
  virtualisation.docker = { enable = true; };
  users.users.alec.extraGroups = [ "docker" ];
}
