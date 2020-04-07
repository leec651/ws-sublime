fs   = require 'fs'
path = require 'path'
data = require './color-constant'

colors =
  red:      "#ff0000"
  bred:     "#e82577"
  orange:   "#f08d49"
  dgreen:   "#004d00"
  forest:   "#228B22"
  green:    "#7ec699"
  lime:     "#bfff00"
  dblue:    "#000080"
  blue:     "#0033ff"
  bblue:    "#7ed3f7"
  dyellow:  "#f8c555"
  yellow:   "#ffffbd"
  purple:   "#a167c9"
  pink:     "#f2c2ff"
  gray:     "#202020"
  white:    "#ffffff"

for name, hex of colors
  hex = if hex.startsWith('#') then hex else "#" + hex
  rule = { name }

  # foreground
  data.rules.push Object.assign {}, rule,
    scope: name
    foreground: hex

  # background
  data.rules.push Object.assign {}, rule,
    scope: "b.#{name}"
    background: hex

  # italic
  data.rules.push Object.assign {}, rule,
    scope: "i.#{name}"
    foreground: hex
    font_style: "italic"


FILE_PATH = path.resolve __dirname, 'color.sublime-color-scheme'
fs.writeFileSync FILE_PATH, JSON.stringify(data, null, 2)