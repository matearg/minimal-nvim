local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fr', builtin.oldfiles, {})
vim.keymap.set('n', 'fg', builtin.git_files, {})
vim.keymap.set('n', 'fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require('telescope').setup{
    pickers = {
        find_files = {
            theme = "dropdown",
            prompt_prefix = "  ",
            previewer = false
        }
    }
}
