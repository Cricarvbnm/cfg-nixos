{ ... }:
{
  programs.nixvim = {
    plugins = {
      nvim-tree.enable = true;
      web-devicons.enable = true;
    };

    keymaps = [
      {
        options.desc = "Toggle Explorer";
        key = "<Leader>e";
        action = "<Cmd>NvimTreeToggle<CR>";
        mode = [ "n" ];
      }
    ];
  };
}
