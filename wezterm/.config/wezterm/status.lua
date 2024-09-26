local wt = require("wezterm")

local module = {}

local function current_dir(pane)
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			local path = cwd.path:gsub(os.getenv("HOME"), "~")
			if string.len(path) > 32 then
				cwd = ".." .. string.sub(path, -32, -1)
			else
				cwd = path
			end
		end
	else
		cwd = ""
	end

	return cwd
end

local function segments_for_right_status(_window, pane)
	return {
		-- window:active_workspace(),
		current_dir(pane)
			.. " "
			.. wt.nerdfonts.md_folder
			.. " ",
		wt.strftime("%a %b %-d %H:%M") .. " " .. wt.nerdfonts.md_calendar_clock,
		-- wt.hostname(),
	}
end

local appearance = require("appearance")

local function update_status(window, pane)
	local SOLID_LEFT_ARROW = wt.nerdfonts.pl_right_hard_divider
	local segments = segments_for_right_status(window, pane)

	local color_scheme = window:effective_config().resolved_palette
	local bg = wt.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	local gradient_to, gradient_from = bg, bg
	local tabbar_bg = bg
	if appearance.is_dark() then
		gradient_from = bg:lighten(0.1)
		tabbar_bg = bg:darken(0.5)
	else
		gradient_from = bg:darken(0.2)
		tabbar_bg = bg:darken(0.05)
	end

	local gradient = wt.color.gradient(
		{
			orientation = "Horizontal",
			colors = { gradient_from, gradient_to },
		},
		#segments -- only gives us as many colours as we have segments.
	)

	local elements = {}

	for i, seg in ipairs(segments) do
		local is_first = i == 1

		if is_first then
			table.insert(elements, { Background = { Color = tabbar_bg } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = SOLID_LEFT_ARROW })
		table.insert(elements, { Foreground = { Color = fg } })
		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end

	window:set_right_status(wt.format(elements))
end

local function toggle_scrollbar(window, pane)
	local overrides = window:get_config_overrides() or {}
	local dimensions = pane:get_dimensions()

	if not pane then
		return
	end

	overrides.enable_scroll_bar = dimensions.scrollback_rows > dimensions.viewport_rows
		and not pane:is_alt_screen_active()

	window:set_config_overrides(overrides)
end

function module.apply(_config)
	wt.on("update-status", update_status)
	wt.on("update-status", toggle_scrollbar)
end

return module
