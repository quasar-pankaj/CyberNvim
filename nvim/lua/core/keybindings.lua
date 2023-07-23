-- luacheck: globals vim
--
local map = require("core.utils.utils").map
vim.g.mapleader = " "

-- Trouble
map("n", "tr", "<cmd>TroubleToggle lsp_references<CR>")
map("n", "td", "<cmd>TroubleToggle lsp_definitions<CR>")
map("n", "cd", "<cmd>Trouble")

-- ZenMode
map("n", "<leader>zm", "<cmd>ZenMode<CR>")

-- NeoTree
map("n", "<leader>nt", "<cmd>Neotree reveal left<CR>")
map("n", "<leader>nf", "<cmd>Neotree reveal float<CR>")

-- Aerial
map("n", "<leader>a", "<cmd>AerialToggle<CR>")
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")
map("n", "{", "<cmd>AerialPrev<CR>")
map("n", "}", "<cmd>AerialNext<CR>")

-- Searching and Highlighting
map("n", "m", "<cmd>noh<CR>")
map("n", "/", "<cmd>set hlsearch<CR>/")
map("n", "i", "<cmd>set nohlsearch<CR>i")
map("n", "a", "<cmd>set nohlsearch<CR>a")
map("n", "I", "<cmd>set nohlsearch<CR>I")
map("n", "A", "<cmd>set nohlsearch<CR>A")

-- Movement
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><cmd>noh<cr><right>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")

-- Command mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Telescope
map("n", "ff", "<cmd>Telescope git_files hidden=true<CR>")
map("n", "fg", "<cmd>Telescope live_grep<CR>")
map("n", "fb", "<cmd>Telescope buffers<CR>")
map("n", "fh", "<cmd>Telescope help_tags<CR>")

-- MoveLine
map("n", "<A-j>", "<cmd>MoveLine(1)<CR>")
map("n", "<A-k>", "<cmd>MoveLine(-1)<CR>")
map("n", "<A-h>", "<cmd>MoveHChar(-1)<CR>")
map("n", "<A-l>", "<cmd>MoveHChar(1)<CR>")
map("n", "<leader>wf", "<cmd>MoveWord(1)<CR>")
map("n", "<leader>wb", "<cmd>MoveWord(-1)<CR>")
map("v", "<A-j>", "<cmd>MoveBlock(1)<CR>")
map("v", "<A-k>", "<cmd>MoveBlock(-1)<CR>")
map("v", "<A-h>", "<cmd>MoveHBlock(-1)<CR>")
map("v", "<A-l>", "<cmd>MoveHBlock(1)<CR>")

-- Notify
map("n", "<ESC>", "<cmd>lua require('notify').dismiss()<CR>")
map("i", "<ESC>", "<cmd>lua require('notify').dismiss()<CR><ESC>")

-- Command mode
map("c", "<C-P>", "<Up>")
map("c", "<C-N>", "<Down>")

-- More LSP stuff
map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

-- Buffers
map("n", "<leader>bn", "<cmd>w | bn<CR>")
map("n", "<leader>bp", "<cmd>w | bp<CR>")

-- Session
map("n", "<leader>s", "<cmd>SessionManager save_current_session<CR>")
map("n", "<leader>o", "<cmd>SessionManager load_session<CR>")

-- ToggleTerm
map("n", "<leader><c-\\>", "<cmd>ToggleTerm direction=tab<cr>")

-- Hop
map("n", "<leader>h", "<cmd>HopWord<cr>")
