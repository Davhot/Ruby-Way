# Для сериализации объекта, нужно определить методы as_json и from_json
require 'json'
require 'time'
require_relative '../marshal/marshal_custom_object.rb'

class Person
  def as_json
    {
      name: @name,
      birthday: @birthday.iso8601,
      beginning: @beginning,
      balance: @balance
    }
  end

  def self.from_json(json)
    data = JSON.parse(json)
    birthday = Time.parse(data["birthday"])
    new(data["name"], birthday, data["beginning"])
  end
end

if $0 == __FILE__
  p1 = Person.new("David", Time.now - (22 * 365 * 86400), 100)
  p p1.as_json

  p2 = Person.from_json(JSON.dump(p1.as_json))
  p p2.as_json
end
