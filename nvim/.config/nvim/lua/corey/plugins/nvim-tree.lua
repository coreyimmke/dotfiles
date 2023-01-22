local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommended from project docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    renderer = {
        icons = {
            show = {
                folder_arrow = false
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
