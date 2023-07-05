local status, fterm = pcall(require, "FTerm")
if not status then
    return
end

-- Для windows `cmd='powershell'` или любой другой терминал
-- Для linux 'cmd='bash'' или любой другой терминал
fterm.setup({
   cmd = "powershell", 
})
