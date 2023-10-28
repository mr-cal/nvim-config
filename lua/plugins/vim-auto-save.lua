-- autosave on pretty much all actions
return {
  {
    "907th/vim-auto-save",
    event = { "InsertEnter", "InsertLeave", "CompleteDone", "TextChanged" },
  },
}
