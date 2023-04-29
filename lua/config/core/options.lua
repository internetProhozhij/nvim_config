--за основу был взят конфиг:
--https://github.com/josean-dev/dev-environment-files

--Функция для экранирования символов. Нужна для реализации
--поддержки кириллицы в командах редактирования.
--(https://habr.com/ru/articles/726400/)
local function escape(str)
	local escape_chars = [[;,."'|\]]
	return vim.fn.escape(str, escape_chars)
end

vim.cmd [[set noswapfile]]

local opt = vim.opt
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

local ru = "фисвуапршолдьтщзйкыегмцчня"
local en = "abcdefghijklmnopqrstuvwxyz"

local ru_shift = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ"
local en_shift = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

local ru_cmd = "Ёё;"
local en_cmd = "~`$"

opt.langmap = vim.fn.join({
    escape(ru_shift) .. ';' .. escape(en_shift),
    escape(ru) .. ';' .. escape(en),
    escape(ru_cmd) .. ';' .. escape(en_cmd),
}, ',')

opt.langremap = true

opt.backup = false
opt.writebackup = false

opt.updatetime = 300

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

