-- Miscelaneous fun stuff
return {
  -- Move stuff with <M-j> and <M-k> in both normal and visual mode
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup()
    end,
  },
  -- Better buffer closing actions. Available via the buffers helper.
  {
    "kazhala/close-buffers.nvim",
    opts = {
      preserve_window_layout = { "this", "nameless" },
    },
  },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
  -- icons
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  -- fix indentations in python files
  {
    "Vimjas/vim-python-pep8-indent",
    ft = { "python" },
  },
  -- open file at last cursor position
  "farmergreg/vim-lastplace",
}
