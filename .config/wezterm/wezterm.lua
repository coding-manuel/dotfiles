-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ======================
-- Appearance
-- ======================
config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font_with_fallback({
  "Iosevka Nerd Font",
  "JetBrains Mono NL",
  "FiraCode Nerd Font",
  "Cascadia Code NF",
})
config.font_size = 12
config.line_height = 1.2
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 8,
  right = 8,
  top = 4,
  bottom = 4,
}

-- ======================
-- Behavior & Performance
-- ======================
config.max_fps = 120
config.cursor_blink_rate = 800
config.scrollback_lines = 10000

-- Visual bell instead of sound
config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 150,
}

-- ======================
-- Tab Bar
-- ======================
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- ======================
-- Hyperlinks
-- ======================
config.hyperlink_rules = {
  -- Linkify things that look like URLs
  {
    regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S+\\b',
    format = '$0',
  },
  -- Linkify email addresses
  {
    regex = '\\b\\w+@[\\w.-]+\\.[a-z]{2,15}\\b',
    format = 'mailto:$0',
  },
  -- Linkify file://...
  {
    regex = '\\bfile://\\S+\\b',
    format = '$0',
  },
}

-- ======================
-- Key Bindings
-- ======================
config.keys = {
  -- Command Palette
  { key = "p", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCommandPalette },

  -- Tabs
  { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
  { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },

  -- Panes
  { key = "h", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "l", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "j", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },

  -- Splits
  { key = "s", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Close pane
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

  -- New tab
  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

  -- Reload config
  { key = "r", mods = "SUPER|SHIFT", action = wezterm.action.ReloadConfiguration },

  -- --------------------------------------------------
  -- Zsh word navigation (Ctrl)
  -- --------------------------------------------------
  { key = "LeftArrow",  mods = "CTRL", action = wezterm.action.SendString "\x1b[1;5D" },
  { key = "RightArrow", mods = "CTRL", action = wezterm.action.SendString "\x1b[1;5C" },
  { key = "Backspace", mods = "CTRL", action = wezterm.action.SendString "\x17" },

  -- --------------------------------------------------
  -- Alt (Option) word navigation
  -- --------------------------------------------------
  { key = "LeftArrow",  mods = "OPT", action = wezterm.action.SendString "\x1bb" },
  { key = "RightArrow", mods = "OPT", action = wezterm.action.SendString "\x1bf" },
  { key = "Backspace", mods = "OPT", action = wezterm.action.SendString "\x1b\x7f" },
}

-- ======================
-- Mouse Bindings
-- ======================
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Up = { streak = 2, button = "Left" } },
    action = wezterm.action.SelectTextAtMouseCursor("Word"),
  },
}

-- ======================
-- Dynamic Font Resize
-- ======================
local function recompute_font_size(window)
  local base = 12
  local dims = window:get_dimensions()
  local overrides = window:get_config_overrides() or {}

  local new_size
  if dims.pixel_width >= 2560 then
    new_size = base + 2
  elseif dims.pixel_width >= 1920 then
    new_size = base
  else
    new_size = base - 1
  end

  if overrides.font_size ~= new_size then
    overrides.font_size = new_size
    window:set_config_overrides(overrides)
  end
end

wezterm.on("window-resized", function(window)
  recompute_font_size(window)
end)

wezterm.on("gui-startup", function(window)
  recompute_font_size(window)
end)

-- ======================
-- Tabline Plugin
-- ======================
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = true,
    theme = "GruvboxDarkHard",
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { "mode" },
    tabline_b = { "workspace" },
    tabline_c = { " " },
    tab_active = {
      "index",
      { "parent", padding = 0 },
      "/",
      { "cwd", padding = { left = 0, right = 1 } },
      { "zoomed", padding = 0 },
    },
    tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
    tabline_x = { "ram", "cpu" },
    tabline_y = { "datetime", "battery" },
    tabline_z = { "domain" },
  },
  extensions = { "resurrect" },
})

tabline.apply_to_config(config)

return config
