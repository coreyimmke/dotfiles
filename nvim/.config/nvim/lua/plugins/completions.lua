return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path"
  },
  config = function()
    local cmp = require("cmp")

    local kind_icons = {
      Text = " ",
      Method = "󰆧 ",
      Function = "󰊕 ",
      Constructor = " ",
      Field = "󰇽 ",
      Variable = "󰂡 ",
      Class = "󰠱 ",
      Interface = " ",
      Module = " ",
      Property = "󰜢 ",
      Unit = " ",
      Value = "󰎠 ",
      Enum = " ",
      Keyword = "󰌋 ",
      Snippet = " ",
      Color = "󰏘 ",
      File = "󰈙 ",
      Reference = " ",
      Folder = "󰉋 ",
      EnumMember = " ",
      Constant = "󰏿 ",
      Struct = " ",
      Event = " ",
      Operator = "󰆕 ",
      TypeParameter = "󰅲 ",
    }

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = (kind_icons[vim_item.kind] or '') .. vim_item.kind
          return vim_item
        end,
      },
    })
  end,
}
