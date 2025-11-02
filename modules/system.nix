{ ... }: {
  system.autoUpgrade = {
    enable = true;
    persistent = false;
    operation = "boot";
    dates = "00:00";
  };
}
