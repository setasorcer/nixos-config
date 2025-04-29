-- Symlinks in status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)
-- Sync yanks
require("session"):setup {
	sync_yanked = true,
}
-- Add ownership info to status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)
-- YAMB plugin
-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = os.getenv("HOME")

table.insert(bookmarks, {
  tag = home_path .. "/",
  path = home_path .. "/",
  key = "h"
})
table.insert(bookmarks, {
  tag = home_path .. "/.config",
  path = home_path .. "/.config/",
  key = "c"
})

table.insert(bookmarks, {
  tag = "/mnt",
  path = "/mnt/",
  key = "d"
})
table.insert(bookmarks, {
  tag = "/run/mount",
  path = "/run/mount/",
  key = "r"
})
table.insert(bookmarks, {
  tag = home_path .. "/.config/nixos",
  path = home_path .. "/.config/nixos/",
  key = "S"
})
table.insert(bookmarks, {
  tag = home_path .. "/music/rsgain",
  path = home_path .. "/music/rsgain/",
  key = "m"
})
table.insert(bookmarks, {
  tag = home_path .. "/pix/snaps",
  path = home_path .. "/pix/snaps/",
  key = "s"
})

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
-- RELATIVE MOTIONS plugin
require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first" })
