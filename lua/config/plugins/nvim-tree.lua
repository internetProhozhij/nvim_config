local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

--рекомендация из документации
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--изменение цвета для маркеров
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

--конфигурация самого дерева файлов
nvimtree.setup({
    sort_by = "case_sensitive",
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
    view = {
        number = true,
        relativenumber = true,
    },
    renderer = {
        add_trailing = true,
        highlight_modified = "name",
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "L",
                edge = "|",
                item = "|",
                bottom = "-",
            },
        },
        icons = {
            show = {
                folder = false,
                file = false,
                git = false,
            },
            glyphs = {
                folder = {
                    arrow_closed = ">",
                    arrow_open = "~",
                },
            },
        },
    },
    
    --нужно для нормальной работы с несколькими окнами
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

--открытие nvim-tree при запуске
local function open_nvim_tree(data)
    --buffer = [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    --buffer = dir
    local directory = vim.fn.isdirectory(data.file) == 1
    
    if not no_name and not directory then
        return
    end

    --изменение каталога
    if directory then
        vim.cmd.cd(data.file)
    end

    --отобразить дерево
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

