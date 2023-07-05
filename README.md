# Структура проекта

    ./
    |
    +---> lua/config/
    |     |
    |     +---> core/ (основные настройки)
    |     |     |
    |     |     +---> colorscheme.lua (подключение цветовой схемы)
    |     |     +---> keymaps.lua     (настройка привязки клавиш)
    |     |     +---> options.lua     (основные параметры редактора)
    |     |
    |     +---> plugins/ (настройка расширений)
    |     |     |
    |     |     +---> comment.lua
    |     |     +---> fterm.lua
    |     |     +---> nvim-tree.lua
    |     |
    |     +---> plugins-setup.lua (установка расширений)
    |
    +---> coc-settings.json (настройка языковых серверов)
    |
    +---> init.lua (подключение файлов конфигурации)
<!---->

# Языковые серверы

- `coc-pyright`: Python
- `coc-clangd`: C/C++/Objective-C
- `coc-java`: Java
- `coc-tsserver`: JS/TypeScript
- `coc-sql`: SQL
