return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  --{
    -- Source:  https://github.com/L3MON4D3/LuaSnip
	  -- "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  --version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	  -- install jsregexp (optional!).
	  --build = "make install_jsregexp"
  --},

  -- Source: Astronvim Custom Snippeds https://astronvim.com/Recipes/snippets
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
        require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnips/"})
      end,
    },

    {
      "lervag/vimtex",
      init = function ()
        --vim.g.vimtex_view_method = "skim"
        -- This is necessary for VimTeX to load properly. The "indent" is optional.
        -- Note that most plugin managers will do this automatically.
        vim.cmd[[ :filetype plugin indent on ]]

        -- This enables Vim's and neovim's syntax-related features. Without this, some VimTeX features will not work (see ":help vimtex-requirements" for more info).
        vim.cmd[[ :syntax enable ]]

        -- Viewer options: One may configure the viewer either by specifying a built-in viewer method:
        vim.cmd[[ let g:vimtex_view_method = 'skim' ]]

      -- Or with a generic interface:
        --vim.cmd[[ let g:vimtex_view_general_viewer = "skim"
        --let g:vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
        --]]

        -- VimTeX uses latexmk as the default compiler backend. If you use it, which is strongly recommended, you probably don't need to configure anything. If you want another compiler backend, you can change it as follows. The list of supported backends and further explanation is provided in the documentation, see ":help vimtex-compiler".
        vim.cmd[[ let g:vimtex_compiler_method = "latexmk" ]]

        -- Most VimTeX mappings rely on localleader and this can be changed with the
        -- following line. The default is usually fine and is the symbol "\".
        vim.cmd[[ let maplocalleader = " " ]]

        -- Note: If the compiler/viewer doesn't start properly, <localleader>li to view the system commands executed to start it. <localleader>lo To inspec the compiler output.
      end,
      lazy = "false",
      event = "BufRead",
    },

    --{
      --'lervag/vimtex',
      --lazy = "false",
      --event = "BufRead",
      --let g:vimtex_view_general_viewer = 'skim'
      --vim.g.vimtex_view_general_viewer
      -- lervag's vimtex general options
      --let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
      -- jdhao_opts
      --let g:vimtex_view_general_viewer = 'skim'
      --let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
      --let g:vimtex_view_general_options = '-r @line @pdf @tex'
      -- common_opts
      --let g:vimtex_compiler_method = 'latexmk'
      --let maplocalleader = " "
    --},

    {
      "jbyuki/quickmath.nvim",
    },

    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end,
    },

    {
      "folke/tokyonight.nvim",
      name = "tokyonight", -- "tokyonight-night", "tokyonight-storm"
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require("tokyonight").setup({
        -- User config goes here, or leave empty to use the default settings.
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        --light_style = "day", -- used when the background is set to light
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the Day style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
        --
        -- You can override specific color groups to use other groups or a hex color
        -- function will be called with a ColorScheme table
        -- @param colors ColorScheme
        on_colors = function(colors) end,

        -- You can override specific highlights to use other groups or a hex color
        -- function will be called with a Highlights and ColorScheme table
        -- @param highlights Highlights
        -- @param colors ColorScheme
        on_highlights = function(highlights, colors) end,
      })
      end,
      -- configuration needs to be set **BEFORE** loading the color scheme
      -- with `colorscheme tokyonight`, `colorscheme tokyonight-night` and
      -- `colorscheme tokyonight-storm`
      --vim.cmd([[colorscheme tokyonight]])
    },
}



