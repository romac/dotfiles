local wt = require("wezterm")

local function scheme_for_appearance(theme)
	local appearance = require("appearance")
	if appearance.is_dark() then
		return theme.dark
	else
		return theme.light
	end
end

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

local function format_tab_title(themes)
	return function(tab, _tabs, _panes, config, hover, max_width)
		local SOLID_LEFT_ARROW = wt.nerdfonts.pl_right_hard_divider
		local SOLID_RIGHT_ARROW = wt.nerdfonts.pl_left_hard_divider

		local theme = themes[config.color_scheme]

		local edge_background = theme.tab_bar.background

		local background = theme.tab_bar.inactive_tab.bg_color
		local foreground = theme.tab_bar.inactive_tab.fg_color

		if tab.is_active then
			background = theme.tab_bar.active_tab.bg_color
			foreground = theme.tab_bar.active_tab.fg_color
		elseif hover then
			background = theme.tab_bar.inactive_tab_hover.bg_color
			foreground = theme.tab_bar.inactive_tab_hover.fg_color
		end

		local edge_foreground = background

		local title = tab_title(tab)

		-- ensure that the titles fit in the available space,
		-- and that we have room for the edges.
		title = wt.truncate_right(title, max_width - 4)

		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = " " .. title .. " " },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = SOLID_RIGHT_ARROW },
		}
	end
end

local function apply(config)
	config.font = wt.font("JetBrains Mono")
	config.font_size = 14
	config.line_height = 1.2
	config.cell_width = 1.0

	config.color_scheme = scheme_for_appearance({
		dark = "Catppuccin Mocha",
		light = "Catppuccin Latte",
	})

	config.window_frame = {
		font = wt.font("JetBrains Mono"),
		font_size = 14,
	}

	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = false
	config.enable_scroll_bar = true
	config.show_new_tab_button_in_tab_bar = false
	config.show_tab_index_in_tab_bar = true
	config.tab_max_width = 24

	local themes = wt.get_builtin_color_schemes()
	wt.on("format-tab-title", format_tab_title(themes))

	config.window_decorations = "RESIZE"
	config.window_padding = {
		left = "1cell",
		right = "1cell",
		top = 0,
		bottom = 0,
	}

	config.initial_cols = 400
	config.initial_rows = 400
end

return { apply = apply }
