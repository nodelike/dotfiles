-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leetcode.nvim key mappings
vim.keymap.set("n", "<leader>tm", "<cmd>Leet menu<cr>", { desc = "Leetcode Menu" })
vim.keymap.set("n", "<leader>tt", "<cmd>Leet test<cr>", { desc = "Leetcode Test" })
vim.keymap.set("n", "<leader>ts", "<cmd>Leet submit<cr>", { desc = "Leetcode Submit" })
vim.keymap.set("n", "<leader>tl", "<cmd>Leet lang<cr>", { desc = "Leetcode Language" })
