{ ... }:
{
  plugins.noice.enable = true;
  keymaps = [
    {
      options.desc = "Noice History";
      key = "<leader>snh";
      action = "<cmd>Noice history<cr>";
    }
    {
      options.desc = "Noice All";
      key = "<leader>sna";
      action = "<cmd>NoiceAll<cr>";
    }
    {
      options.desc = "Noice Last";
      key = "<leader>snl";
      action = "<cmd>Noice last<cr>";
    }
    {
      options.desc = "Dismiss All";
      key = "<leader>snd";
      action = "<cmd>Noice dismiss<cr>";
    }
  ];
}
