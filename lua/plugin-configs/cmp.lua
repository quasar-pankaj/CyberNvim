local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
  enabled = function()
    -- disables in comments
    local context = require("cmp.config.context")
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
  preselect = "none",
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
      mode = "symbol",
      symbol_map = { Copilot = "" },
    }),
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping.scroll_docs(-4),
    ["<C-k"] = cmp.mapping.scroll_docs(4),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
  },
  sources = {
    { name = "copilot",  priority = 100 },
    { name = "nvim_lsp", priority = 90 },
    { name = "nvim_lua", priority = 80 },
    { name = "luasnip",  keyword_length = 2, priority = 70 },
    {
      name = "path",
      option = {
        trailing_slash = true,
      },
      priority = 60,
    },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.exact,
      require("copilot_cmp.comparators").prioritize,
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})
