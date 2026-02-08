" Temp fix for https://github.com/nvim-treesitter/nvim-treesitter/issues/8432
setlocal indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
