-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>q", ":qall<CR>", { desc = "Exit Vim" })
keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save file in insert mode" })
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file in normal mode" })

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous tab" }) --  go to previous tab

-- move selected text
if true then
	keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	keymap.set("v", "K", ":m '>-2<CR>gv=gv")
end
