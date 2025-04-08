return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal", -- ← bottom split
      size = 15,                -- height of the terminal window (default is 15)
      open_mapping = [[<leader>tt]], -- toggle key
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    })
  end,
}

