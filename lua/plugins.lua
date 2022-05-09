local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require("packer").startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})

    use({"onsails/lspkind-nvim", event = "VimEnter"})
    -- auto-completion engine
    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    -- use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] })

    -- Python indent (follows the PEP8 style)
    use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })

    -- Python-related text object
    use({ "jeetsukumaran/vim-pythonsense", ft = { "python" } })

    -- IDE for Lisp
    if utils.executable("sbcl") then
      -- use 'kovisoft/slimv'
      use({ "vlime/vlime", rtp = "vim/", ft = { "lisp" } })
    end

    -- Super fast buffer jump
    use {
      'phaazon/hop.nvim',
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim_hop') end, 2000)
      end
    }

    -- Clear highlight search automatically for you
    -- use({"romainl/vim-cool", event = "VimEnter"})

    -- Show match number and index for searching
    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
      config = [[require('config.hlslens')]]
    }

    -- Stay after pressing * and search selected text
    use({"haya14busa/vim-asterisk", event = 'VimEnter'})

    -- File search, tag search and more
    if vim.g.is_win then
      use({"Yggdroot/LeaderF", cmd = "Leaderf"})
    else
      use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })
    end

    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- search emoji and other symbols
    use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}

    -- colorscheme / themes
    use({"lifepillar/vim-gruvbox8", opt = true})

    -- Show git change (change, delete, add) signs in vim sign column
    use({"mhinz/vim-signify", event = 'BufEnter'})
    -- Another similar plugin
    -- use 'airblade/vim-gitgutter'

    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}

    -- footer/bottom bar (like vim-airline)
    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.statusline')]]
    }

    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })

    -- fancy start screen
    use { 'goolord/alpha-nvim', event = 'VimEnter', config = [[require('config.alpha-nvim')]] }

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = 'VimEnter',
      config = [[require('config.indent-blankline')]]
    })

    -- Highlight URLs inside vim
    use({"itchyny/vim-highlighturl", event = "VimEnter"})

    -- notification plugin
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim-notify') end, 2000)
      end
    })

    -- Only install these plugins if ctags are installed on the system
    if utils.executable("ctags") then
      -- show file tags in vim window
      use({"liuchengxu/vista.vim", cmd = "Vista"})
    end

    -- Snippet engine and snippet template
    use({"SirVer/ultisnips", event = 'InsertEnter'})
    use({ "honza/vim-snippets", after = 'ultisnips'})

    -- Automatic insertion and deletion of a pair of characters
    use({"Raimondi/delimitMate", event = "InsertEnter"})

    -- Comment plugin
    use({"tpope/vim-commentary", event = "VimEnter"})

    -- Multiple cursor plugin like Sublime Text?
    -- use 'mg979/vim-visual-multi'

    -- Autosave files on certain events
    use({
      "Pocco81/AutoSave.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.autosave') end, 1500)
      end
    })

    -- Show undo history visually
    use({"simnalamburt/vim-mundo", cmd = {"MundoToggle", "MundoShow"}})

    -- Handy unix command inside Vim (Rename, Move etc.)
    use({"tpope/vim-eunuch", cmd = {"Rename", "Delete"}})

    -- Repeat vim motions
    use({"tpope/vim-repeat", event = "VimEnter"})

    -- Show the content of register in preview window
    -- Plug 'junegunn/vim-peekaboo'
    use({ "jdhao/better-escape.vim", event = { "InsertEnter" } })

    -- Syntax check and make
    -- use 'neomake/neomake'

    -- Auto format tools
    use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
    -- use 'Chiel92/vim-autoformat'

    -- Git command inside vim
    use({ "tpope/vim-fugitive", event = "User InGitRepo" })

    -- Better git log display
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })

    use({ "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = {"Conflicted"}})

    use({ "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('config.bqf')]] })

    -- Better git commit experience
    use({"rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]]})

    -- Another markdown plugin
    use({ "plasticboy/vim-markdown", ft = { "markdown" } })

    -- Faster footnote generation
    use({ "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } })

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use({ "godlygeek/tabular", cmd = { "Tabularize" } })

    -- Markdown JSON header highlight plugin
    use({ "elzr/vim-json", ft = { "json", "markdown" } })

    use({'folke/zen-mode.nvim', cmd = 'ZenMode', config = [[require('config.zen-mode')]]})

    use({"chrisbra/unicode.vim", event = "VimEnter"})

    -- Additional powerful text object for vim, this plugin should be studied
    -- carefully to use its full power
    use({"wellle/targets.vim", event = "VimEnter"})

    -- Plugin to manipulate character pairs quickly
    -- use 'tpope/vim-surround'
    use({"machakann/vim-sandwich", event = "VimEnter"})

    -- Add indent object for vim (useful for languages like Python)
    use({"michaeljsmith/vim-indent-object", event = "VimEnter"})

    if utils.executable("tmux") then
      -- .tmux.conf syntax highlighting and setting check
      use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })
    end

    -- Modern matchit implementation
    use({"andymass/vim-matchup", event = "VimEnter"})

    -- Smoothie motions
    -- use 'psliwka/vim-smoothie'
    use({
      "karb94/neoscroll.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.neoscroll') end, 2000)
      end
    })

    use({"tpope/vim-scriptease", cmd = {"Scriptnames", "Message", "Verbose"}})

    -- Asynchronous command execution
    use({ "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } })
    -- Another asynchronous plugin
    -- Plug 'tpope/vim-dispatch'

    use({ "cespare/vim-toml", ft = { "toml" }, branch = "main" })

    -- Debugger plugin
    use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })

    -- Session management plugin
    use({"tpope/vim-obsession", cmd = 'Obsession'})

    use({"ojroques/vim-oscyank", cmd = {'OSCYank', 'OSCYankReg'}})

    -- The missing auto-completion for cmdline!
    use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

    -- showing keybindings
    use {"folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function() require('config.which-key') end, 2000)
    end
    }

    -- file explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = [[require('config.nvim-tree')]]
    }
  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
