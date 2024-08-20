local wt = require("wezterm")
local projects = require("projects")
-- local layouts = require("layouts")

local module = {}

local function move_pane(key, direction)
	return {
		key = key,
		mods = "CTRL",
		action = wt.action.ActivatePaneDirection(direction),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wt.action.AdjustPaneSize({ direction, 3 }),
	}
end

function module.apply(config)
	config.leader = {
		key = "z",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	config.keys = {
		-- Move panes
		move_pane("j", "Down"),
		move_pane("k", "Up"),
		move_pane("h", "Left"),
		move_pane("l", "Right"),

		-- Split panes
		{
			key = "Enter",
			mods = "SUPER",
			action = wt.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "Enter",
			mods = "SUPER|SHIFT",
			action = wt.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},

		-- Edit settings
		{
			key = ",",
			mods = "SUPER",
			action = wt.action.SpawnCommandInNewTab({
				cwd = wt.home_dir,
				args = { os.getenv("SHELL"), "-c", "nvim " .. wt.shell_quote_arg(wt.config_dir) },
			}),
		},

		-- Move tabs
		{
			key = "LeftArrow",
			mods = "SUPER|ALT",
			action = wt.action.MoveTabRelative(-1),
		},
		{
			key = "RightArrow",
			mods = "SUPER|ALT",
			action = wt.action.MoveTabRelative(1),
		},

		-- Zoom pane
		{
			key = "z",
			mods = "LEADER",
			action = wt.action.TogglePaneZoomState,
		},

		-- Layouts
		-- {
		-- 	key = "l",
		-- 	mods = "LEADER",
		-- 	action = layouts.choose_layout(),
		-- },

		-- Projects
		{
			key = "p",
			mods = "LEADER",
			action = projects.choose_project(),
		},

		-- Workspaces
		{
			key = "f",
			mods = "LEADER",
			action = wt.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},

		-- Resize panes
		{
			key = "r",
			mods = "LEADER",
			action = wt.action.ActivateKeyTable({
				name = "resize_panes",
				one_shot = false,
				timeout_milliseconds = 1000,
			}),
		},

		-- Clear scrollback
		{
			key = "k",
			mods = "SUPER",
			action = wt.action.Multiple({
				wt.action.ClearScrollback("ScrollbackAndViewport"),
				wt.action.SendKey({ key = "L", mods = "CTRL" }),
			}),
		},

		-- Ctrl-Z
		{
			key = "z",
			mods = "LEADER|CTRL",
			action = wt.action.SendKey({ key = "z", mods = "CTRL" }),
		},
	}

	config.key_tables = {
		resize_panes = {
			resize_pane("j", "Down"),
			resize_pane("k", "Up"),
			resize_pane("h", "Left"),
			resize_pane("l", "Right"),
		},
	}
end

return module
