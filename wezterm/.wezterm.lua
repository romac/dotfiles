function scheme_for_appearance(appearance, theme)
  if appearance:find "Dark" then
    return theme.dark
  else
    return theme.light
  end
end

local wt = require 'wezterm'

return {
  font = wt.font 'JetBrainsMono Nerd Font',
  font_size = 14,
  line_height = 1.1,

  color_scheme = scheme_for_appearance(wt.gui.get_appearance(),
    { dark = 'Catppuccin Mocha', light = 'Catppuccin Latte' }),

  window_frame = {
    font = wt.font 'JetBrainsMono Nerd Font',
    font_size = 14,
  },

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  enable_scrollbar = true,

  window_decorations = 'RESIZE',
  window_padding = {
    left = '1cell',
    right = '1cell',
    top = 0,
    bottom = 0,
  },

}
