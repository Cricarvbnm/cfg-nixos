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
  };

  clipboard = {
    providers.wl-copy.enable = true;
    register = "unnamedplus";
  };

  keymaps = [
    {
      options.desc = "Quit";
      key = "<Leader>q";
      action = "<Cmd>q<CR>";
      mode = [ "n" ];
    }
    {
      options.desc = "Force Quit";
      key = "<Leader>Q";
      action = "<Cmd>q!<CR>";
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
