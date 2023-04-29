local status, fterm = pcall(require, "FTerm")
if not status then
    return
end


fterm.setup({
   cmd = "powershell", 
})
