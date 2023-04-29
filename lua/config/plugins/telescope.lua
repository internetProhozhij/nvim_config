--безопасный импорт
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

--безопасный импорт
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end


telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, --переход к предыдущему результату
                ["<C-j>"] = actions.move_selection_next, --переход к следующему результату
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    },
})
