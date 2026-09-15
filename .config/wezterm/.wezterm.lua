local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Arc Dark'
config.use_fancy_tab_bar = false

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

config.background = {
    {
        source = {
            File = 'C:\\Users\\leo\\wezterm-bg.png',
        },
        vertical_align = 'Middle',
        horizontal_align = 'Center',
        opacity = 1.0,
        hsb = {
            hue = 1.0,
            saturation = 0.3,
            brightness = 0.1,
        },
    },
}

config.enable_scroll_bar = true

-- Added color customizations for scrollbar and cursor
config.colors = {
  scrollbar_thumb = '#9C1FF2',
  cursor_bg = '#9e1ff2',
  cursor_border = '#9C1FF2',
  cursor_fg = '#ffffff',
}

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_thickness = "1pt"
config.cursor_blink_rate = 250
config.animation_fps = 1

config.font = wezterm.font_with_fallback({
  {
    family = 'Monaspace Radon NF',
    weight = 'Regular',
    style = 'Normal',
  },
})

config.font_size = 12.0

config.font_rules = {
  -- Bold
  {
    intensity = 'Bold',
    font = wezterm.font {
      family = 'Monaspace Radon NF',
      weight = 'Bold',
      style = 'Normal',
    },
  },

  -- Italic
  {
    italic = true,
    font = wezterm.font {
      family = 'Monaspace Radon NF',
      weight = 'Regular',
      style = 'Italic',
    },
  },

  -- Bold + italic
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'Monaspace Radon NF',
      weight = 'Bold',
      style = 'Italic',
    },
  },
}


return config
