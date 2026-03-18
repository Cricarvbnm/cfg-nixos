{ ... }:
{
  plugins.lazygit.enable = true;
  keymaps = [
    {
      options.desc = "LazyGit";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
    }
  ];
}
