require 'json'

data = {
  str: "Hi",
  ar: [1, 2, 3],
  bool: true,
  obj: Object.new
}

puts JSON.dump(data)
