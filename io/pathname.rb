require 'pathname'

path = Pathname.new('/home/david')
file = Pathname.new('15.json')

p2 = path + file
p path.directory?
p path.file?
p file.directory?
p file.file?

p p2.split
p file.extname

p path.parent
p path.children

p path.relative?
p path.absolute?
