# Finds and lists TODO, HACK, BUG, etc comment
{ ... }:
{
  plugins.todo-comments.enable = true;

  keymaps = [
    {
      options.desc = "Next Todo Comment";
      key = "]t";
      action = "<cmd>lua require('todo-comments').jump_next()<cr>";
    }
    {
      options.desc = "Previous Todo Comment";
      key = "[t";
      action = "<cmd>lua require('todo-comments').jump_prev()<cr>";
    }
    {
      options.desc = "Todo (Trouble)";
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
    }
    {
      options.desc = "Todo/Fix/Fixme (Trouble)";
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
    }
    {
      options.desc = "Todo";
      key = "<leader>st";
      action = "<cmd>TroubleTelescope<cr>";
    }
    {
      options.desc = "Todo/Fix/Fixme";
      key = "<leader>sT";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>";
    }
  ];
}
