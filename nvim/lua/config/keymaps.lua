-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- n means normal mode
-- silent means no showing command output
-- noremap stops the mapping from being remapped by other stuff
vim.keymap.set("n", "j", "jzz", { silent = true, noremap = true })
vim.keymap.set("n", "k", "kzz", { silent = true, noremap = true })

vim.keymap.set("n", "<C-U>", "<C-U>zz", { silent = true, noremap = true })
vim.keymap.set("n", "<C-D>", "<C-D>zz", { silent = true, noremap = true })

vim.keymap.set("i", "<C-H>", "<Left>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-J>", "<Down>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-K>", "<Up>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-L>", "<Right>", { silent = true, noremap = true })

vim.keymap.set("i", "<C-D>", "<C-Left>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-F>", "<C-Right>", { silent = true, noremap = true })
