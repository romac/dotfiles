local wt = require("wezterm")

local module = {}

local catppuccin = {
	dark = "Catppuccin Mocha",
	light = "Catppuccin Latte",
}

local function scheme_for_appearance(theme)
	local appearance = require("appearance")
	if appearance.is_dark() then
		return theme.dark
	else
		return theme.light
	end
end

local function basename(string)
	return string:gsub("(.*[/\\])(.*)", "%2")
end

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	else
		-- return basename(tostring(tab_info.active_pane.current_working_dir))
		return basename(tab_info.active_pane.title)
	end
end

local function format_tab_title(themes)
	local SOLID_RIGHT_ARROW = wt.nerdfonts.pl_left_hard_divider

	return function(tab, tabs, _panes, config, hover, max_width)
		local theme = themes[config.color_scheme]

		local edge_background = theme.tab_bar.background
		local background = theme.tab_bar.inactive_tab.bg_color
		local foreground = theme.tab_bar.inactive_tab.fg_color
		local right_arrow = ""

		if tab.is_active then
			background = theme.tab_bar.active_tab.bg_color
			foreground = theme.tab_bar.active_tab.fg_color
			-- right_arrow = SOLID_RIGHT_ARROW
		elseif hover then
			background = theme.tab_bar.inactive_tab_hover.bg_color
			foreground = theme.tab_bar.inactive_tab_hover.fg_color
		end

		local is_last = tab.tab_index == #tabs - 1
		if is_last then
			right_arrow = SOLID_RIGHT_ARROW
		end

		local edge_foreground = background

		local title = tab_title(tab)

		local prefix = " "
		if tab.tab_index == 0 then
			prefix = "  "
		end

		local icon = wt.nerdfonts.dev_terminal
		if string.find(title, "^nvim:") then
			title = title:gsub("^nvim: ", "")
			icon = wt.nerdfonts.md_file_document_edit
		end

		title = wt.truncate_right(title, max_width - 4)

		local pane = tab.active_pane
		if pane.is_zoomed then
			icon = wt.nerdfonts.cod_zoom_in .. " " .. icon
		end

		if pane.title:find("^Copy mode:") then
			icon = wt.nerdfonts.md_content_copy .. " " .. icon
		end

		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = prefix .. icon .. "  " .. title .. " " },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = right_arrow },
		}
	end
end

wt.on("window-config-reloaded", function(window, _pane)
	local overrides = window:get_config_overrides() or {}
	local scheme = scheme_for_appearance(catppuccin)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

function module.apply(config)
	config.font = wt.font("JetBrains Mono")
	config.font_size = 14
	config.line_height = 1.2
	-- config.cell_width = 1.0
	config.freetype_load_target = "HorizontalLcd"

	config.adjust_window_size_when_changing_font_size = false

	config.color_scheme_dirs = { wt.config_dir .. "/themes" }
	config.color_scheme = scheme_for_appearance(catppuccin)

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

	local themes = wt.color.get_builtin_schemes()
	wt.on("format-tab-title", format_tab_title(themes))

	config.window_decorations = "RESIZE"
	config.window_padding = { left = "1cell", right = 0, top = 0, bottom = 0 }

	config.initial_cols = 400
	config.initial_rows = 400
end

return module
