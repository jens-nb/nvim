local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- empty setup using defaults
--require("nvim-tree").setup()

-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
