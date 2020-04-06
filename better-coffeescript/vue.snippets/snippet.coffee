fs = require 'fs'

names = ['$router','$data','$props','$el','$options','$parent','$root','$children','$slots','$scopedSlots','$refs','$isServer','$attrs','$listeners','$watch','$set','$delete','$on','$once','$off','$emit','$mount','$forceUpdate','$nextTick','$destroy','$store','$route']

for name in names
  data = """
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
    <key>content</key>
    <string>\\#{name}</string>
    <key>name</key>
    <string>Vue.#{name}</string>
    <key>scope</key>
    <string>source.coffee</string>
    <key>tabTrigger</key>
    <string>v#{name}</string>
  </dict>
  </plist>
  """

  name = "./vue.#{name}.tmSnippet"
  fs.writeFileSync(name, data)
console.log 'done'
