fs = require 'fs'
path = require 'path'

names =
  data: '$data'
  # props: '$props'
  # el: '$el'
  options: '$options'
  # parent: '$parent'
  root: '$root'
  # children: '$children'
  slots: '$slots'
  # scopedSlots: '$scopedSlots'
  refs: '$refs'
  # isServer: '$isServer'
  attrs: '$attrs'
  # listeners: '$listeners'
  watch: '$watch $0'
  set: '$set this.${2:object}, ${3:index}, ${4:content}'
  # delete: '$delete'
  on: '$on'
  once: '$once'
  # off: '$off'
  emit: "$emit '${1:name}', ${2:content}"
  # mount: '$mount'
  # forceUpdate: '$forceUpdate'
  # nextTick: '$nextTick'
  # destroy: '$destroy'
  store: '$store.'
  # route: '$route.'
  router: '$router.push({name: ${1:name}}).catch(->)'

# delete all the files
for file in fs.readdirSync(__dirname) when file.endsWith('.tmSnippet')
  fs.unlinkSync path.resolve(__dirname, file)

# create vue snippets
for name, content of names
  data = """
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
    <key>content</key>
    <string>\\#{content}</string>
    <key>name</key>
    <string>Vue.#{name}</string>
    <key>scope</key>
    <string>source.coffee</string>
    <key>tabTrigger</key>
    <string>v-#{name}</string>
  </dict>
  </plist>
  """
  name = "./vue.#{name}.tmSnippet"
  fs.writeFileSync(name, data)

console.log 'done'
