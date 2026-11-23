-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

----------------------------------------
--- Auto save
----------------------------------------
autocmd({ "BufLeave", "FocusLost" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

----------------------------------------
--- ShaDa temp cleanup
----------------------------------------
-- nvim writes ShaDa through main.shada.tmp.a..z. Sessions killed mid-exit
-- leave these behind, and once all 26 exist every ShaDa write fails (E138).
-- A real write takes milliseconds, so anything older than an hour is stale.
local shada_tmp_max_age_seconds = 60 * 60

local function remove_stale_shada_tmp_files()
  local pattern = vim.fn.stdpath("state") .. "/shada/main.shada.tmp.?"
  local cutoff = os.time() - shada_tmp_max_age_seconds
  local removed = vim.tbl_filter(function(path)
    local stat = vim.uv.fs_stat(path)
    -- The file may vanish between glob and stat if another nvim renames it
    return stat ~= nil and stat.mtime.sec < cutoff and os.remove(path) == true
  end, vim.fn.glob(pattern, false, true))

  if #removed > 0 then
    -- Keep this visible: frequent cleanups mean sessions are being killed
    -- mid-exit and losing their history.
    vim.notify(("Removed %d stale ShaDa temp files"):format(#removed), vim.log.levels.INFO)
  end
end
