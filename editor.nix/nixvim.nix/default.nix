{
  imports = [
    ./languages.nix
    ./plugins.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings.background.dark = "mocha";
  };

  globals = {
    mapleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;

    incsearch = true;
    ignorecase = true;
    smartcase = true;

    list = true;
    listchars = "tab:<->,trail:-,nbsp:+";

    foldmethod = "marker";
  };

  clipboard = {
    providers.wl-copy.enable = true;
    register = "unnamedplus";
  };

  keymaps = [
    {
      options.desc = "Quit (close current window)";
      key = "<Leader>qq";
      action = "<Cmd>q<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Write & quit (save and close)";
      key = "<Leader>qw";
      action = "<Cmd>wq<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Force quit all (discard all changes)";
      key = "<Leader>qQ";
      action = "<Cmd>qa!<CR>";
      mode = [ "n" ];
    }

    {
      options.desc = "Buffer Next";
      key = "<S-l>";
      action = "<Cmd>bnext<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Buffer Previous";
      key = "<S-h>";
      action = "<Cmd>bprevious<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Buffer Delete";
      key = "<Leader>bd";
      action = "<Cmd>bdelete<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Buffer Save";
      key = "<C-s>";
      action = "<Cmd>w<CR>";
      mode = [
        "n"
        "i"
      ];
    }
  ];
}
