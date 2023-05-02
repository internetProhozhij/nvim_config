--автоматическая установка packer
local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
	return true
end
	return false
end

local packer_bootstrap = ensure_packer()

--автоматическое обновление зависимостей
vim.cmd([[ 
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])
-- рекомендация из документации 

--безопасный импорт
local status, packer = pcall(require, "packer")
if not status then
	return
end

--добавление расширений
return packer.startup(function(use)
	--ядро 
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	--расширение для удобной навигации по открытм окнам
	use("christoomey/vim-tmux-navigator")

	--расширение для комментирования
	use("numToStr/Comment.nvim")

	--дерево файлов
	use("nvim-tree/nvim-tree.lua")

    --менеджер языковых пакетов
    use({'neoclide/coc.nvim', branch = 'release'})
    
    --терминал
    use("numToStr/FTerm.nvim")
    
    --цветовая схема
    use("tanvirtin/monokai.nvim")

    if packer_bootstrap then
		require("packer").sync()
	end
end)
