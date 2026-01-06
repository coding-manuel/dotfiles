-- return {
--   black = 0xff181819,
--   white = 0xffe2e2e3,
--   red = 0xfffc5d7c,
--   green = 0xff9ed072,
--   blue = 0xff76cce0,
--   yellow = 0xffe7c664,
--   orange = 0xfff39660,
--   magenta = 0xffb39df3,
--   grey = 0xff7f8490,
--   transparent = 0x00000000,

--   bar = {
--     bg = 0xf02c2e34,
--     border = 0xff2c2e34,
--   },
--   popup = {
--     bg = 0xc02c2e34,
--     border = 0xff7f8490
--   },
--   bg1 = 0xff363944,
--   bg2 = 0xff414550,

--   with_alpha = function(color, alpha)
--     if alpha > 1.0 or alpha < 0.0 then return color end
--     return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
--   end,
-- }
return {
  black = 0xff282828,
  white = 0xffebdbb2,
  red = 0xfffb4934,
  green = 0xffb8bb26,
  blue = 0xff83a598,
  yellow = 0xfffabd2f,
  orange = 0xfffe8019,
  magenta = 0xffd3869b,
  grey = 0xff928374,
  transparent = 0x00000000,

  bar = {
    bg = 0xff1d2021,
    border = 0xff3c3836,
  },
  popup = {
    bg = 0xcc1d2021, -- 80% opacity
    border = 0xff928374,
  },
  bg1 = 0xff3c3836,
  bg2 = 0xff504945,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
