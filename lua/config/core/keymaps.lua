--задание клавиши пробела
vim.g.mapleader = " "

local keymap = vim.keymap

--управление окнами
keymap.set("n", "<leader>sv", "<C-w>v") --разделение по вертикали
keymap.set("n", "<leader>ым", "<C-w>v") --разделение по вертикали

keymap.set("n", "<leader>sh", "<C-w>s") --разделение по горизонтали
keymap.set("n", "<leader>ыр", "<C-w>s") --разделение по горизонтали

keymap.set("n", "<leader>se", "<C-w>=") --сделать окна одного размера
keymap.set("n", "<leader>ыу", "<C-w>=") --сделать окна одного размера

keymap.set("n", "<leader>sx", ":close<CR>") --закрыть выбранное окно
keymap.set("n", "<leader>ыч", ":close<CR>") --закрыть выбранное окно

keymap.set("n", "<leader>to", ":tabnew<CR>") --новая вкладка
keymap.set("n", "<leader>ещ", ":tabnew<CR>") --новая вкладка

keymap.set("n", "<leader>tx", ":tabclose<CR>") --закрыть ткущую вкладку
keymap.set("n", "<leader>еч", ":tabclose<CR>") --закрыть ткущую вкладку

keymap.set("n", "<leader>tn", ":tabn<CR>") --переход к следующей вкладке
keymap.set("n", "<leader>ет", ":tabn<CR>") --переход к следующей вкладке

keymap.set("n", "<leader>tp", ":tabp<CR>") --переход к предыдущей вкладке
keymap.set("n", "<leader>ез", ":tabp<CR>") --переход к предыдущей вкладке

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>у", ":NvimTreeToggle<CR>") -- toggle file explorer

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") --поиск файлов в ткущей директории
keymap.set("n", "<leader>аа", "<cmd>Telescope find_files<CR>") --поиск файлов в ткущей директории

keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>аы", "<cmd>Telescope live_grep<CR>")

keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") --поиск по содержимому текущей строки
keymap.set("n", "<leader>ас", "<cmd>Telescope grep_string<CR>") --поиск по содержимому текущей строки

keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>аи", "<cmd>Telescope buffers<CR>")

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") --поиск по вспомогальтьным тегам
keymap.set("n", "<leader>ар", "<cmd>Telescope help_tags<CR>") --поиск по вспомогальтьным тегам

--telescope + git
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") --отображение фиксаций
keymap.set("n", "<leader>пс", "<cmd>Telescope git_commits<CR>") --отображение фиксаций

keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>") --отображение фиксаций для текущего файла
keymap.set("n", "<leader>пас", "<cmd>Telescope git_bcommits<CR>") --отображение фиксаций для текущего файла

keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") --отображение веток
keymap.set("n", "<leader>пи", "<cmd>Telescope git_branches<CR>") --отображение веток

keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") --отобаржение diff-ов
keymap.set("n", "<leader>пы", "<cmd>Telescope git_status<CR>") --отобаржение diff-ов

--coc
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", {silent = true})
keymap.set("n", "Л", "<CMD>lua _G.show_docs()<CR>", {silent = true})

keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap.set("n", "пв", "<Plug>(coc-definition)", {silent = true})

keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap.set("n", "пн", "<Plug>(coc-type-definition)", {silent = true})

keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap.set("n", "пш", "<Plug>(coc-implementation)", {silent = true})

keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
keymap.set("n", "пк", "<Plug>(coc-references)", {silent = true})

keymap.set("n", "<leader>cd", ":CocDiagnostics<CR>")
keymap.set("n", "<leader>св", ":CocDiagnostics<CR>")

local opts = {silent = true, nowait = true, expr = true}
keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keymap.set("n", "<C-а>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)

keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keymap.set("n", "<C-и>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keymap.set("i", "<C-а>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)

keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keymap.set("i", "<C-и>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keymap.set("v", "<C-а>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)

keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keymap.set("v", "<C-и>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

keymap.set("i", "<M-s>", "<C-r>=CocActionAsync('showSignatureHelp')<CR>", {silent = true})
keymap.set("i", "<M-ы>", "<C-r>=CocActionAsync('showSignatureHelp')<CR>", {silent = true})
-- keymap.set("i", "<M-p>", "<C-\\><C-O>:call CocActionAsync('showSignatureHelp')<CR>")
-- keymap.set("n", "<C-=>", "<C-\\><C-O>:call CocActionAsync('showSignatureHelp')<CR>")
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

--Fterm
keymap.set("n", "<ESC>ft", "<CMD>lua require('FTerm').open()<CR>")
keymap.set("n", "<ESC>ае", "<CMD>lua require('FTerm').open()<CR>")

keymap.set("t", "<ESC>ft", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>")
keymap.set("t", "<ESC>ае", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>")
