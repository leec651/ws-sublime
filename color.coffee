fs   = require 'fs'
path = require 'path'
data = require './color-constant'

colors =
  red:      "#ff0000"
  bred:     "#e82577"
  orange:   "#f08d49"
  dgreen:   "#004d00"
  forest:   "#228b22"
  green:    "#7ec699"
  lime:     "#bfff00"
  dblue:    "#041652"
  blue:     "#0033ff"
  blue2:    "#4398f0"
  bblue:    "#7ed3f7"
  dyellow:  "#f8c555"
  yellow:   "#ffffbd"
  purple:   "#a167c9"
  pink:     "#f2c2ff"
  gray:     "#202020"
  white:    "#ffffff"

specials =
  constant:
    background: colors.dblue
    foreground: colors.blue2


bg = (background) -> "#{background}cc"

for scope, hex of colors
  # foreground
  data.rules.push
    scope: scope
    foreground: hex

  # background
  data.rules.push
    scope: "b.#{scope}"
    background: bg(hex)

  # italic
  data.rules.push
    scope: "i.#{scope}"
    foreground: hex
    font_style: "italic"


for scope, {background, foreground, font_style} of specials
  background && background = bg(background)
  data.rules.push {scope, background, foreground, font_style}


console.log JSON.stringify(data, null, 2)
FILE_PATH = path.resolve __dirname, 'color.sublime-color-scheme'
fs.writeFileSync FILE_PATH, JSON.stringify(data, null, 2)