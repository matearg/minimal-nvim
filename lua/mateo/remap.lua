local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)
vim.keymap.set("n", "<S-e>", ":Lex 25<CR>", opts)
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("x", "p", "\"_dP", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", ":rezise +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":rezise -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical rezise -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical rezise +2<CR>", opts)

vim.keymap.set("n", "<S-l>", vim.cmd.bnext, opts)
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious, opts)
