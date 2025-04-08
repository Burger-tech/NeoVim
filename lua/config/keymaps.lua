-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tf", function()
  require("toggleterm.terminal").Terminal
    :new({ direction = "float", cmd = "bash" }) -- or bash/fish
    :toggle()
end, { desc = "Toggle Floating Terminal" })

