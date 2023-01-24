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

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<S-l>", vim.cmd.bnext, opts)
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious, opts)

function Toggle_shiftwidht()
    local value = vim.api.nvim_get_option_value("shiftwidth", {})
    if value == 2 then
        value = 4
    else
        value = 2
    end

    vim.opt.shiftwidth = value
    vim.notify("Indent" .. " set to " .. tostring(value))
end

vim.keymap.set("n", "<leader>i", ":lua Toggle_shiftwidht()<CR>")
