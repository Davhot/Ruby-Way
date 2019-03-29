require 'yaml'

Person = Struct.new(:name)

puts YAML.dump("Hello")
puts YAML.dump({this: "is hash", with: "some symbols"})
puts YAML.dump((1..10))
puts YAML.dump((1..10).to_a)
puts YAML.dump(Person.new("Alice"))
