-- Auto-install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color scheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Navigate between tmux and vim 
    use 'christoomey/vim-tmux-navigator'

    -- Maximize split views
    use 'szw/vim-maximizer'

    -- Block comments
    use 'tpope/vim-commentary'

    -- ThePrimagean's favorites
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use{
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
    use 'nvim-treesitter/playground'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    -- Help for setting up the LSP client 
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Language specific
    -- Used for setting up rust_analyzer
    use 'simrat39/rust-tools.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
