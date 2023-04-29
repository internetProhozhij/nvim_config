local status, _ = pcall(vim.cmd, "colorscheme monokai")
if not status then
    return 
end

--ссылка на рекомендации по настройке цветовой схемы
--https://github.com/tanvirtin/monokai.nvim
local mon = require("monokai")
mon.setup({
    palette = {
        base2 = "#171717",
    }
})
