local map = require("helpers.keys").map

-- jk to escape
map("i", "jk", "<esc>")

-- semicolon to colon
map("n", ";", ":")

-- control + hjkl to switch windows
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- shift + arrow keys to resize windows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- shift + hl to switch buffers
map("n", "<S-l>", ":bnext<CR>", "Go to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Go to previous buffer")

-- clear highlight after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

map("n", "/", [[/\c]], "Case insenstive search")


vim.keymap.set({ "n", "v" }, "<leader>gl", function()
  local mode = string.lower(vim.fn.mode())
  require("gitlinker").get_buf_range_url(mode)
end, {
  silent = true,
  desc = "get git permlink",
})
