# Для маршалинга своих объектов, необходима реализация методов marshal_load и marshal_dump,
# которые будут автоматически вызываться при маршалинге

class Person
  attr_reader :balance, :name

  def initialize(name, birthday, beginning)
    @name = name
    @birthday = birthday
    @beginning = beginning
    @age = (Time.now - @birthday) / (365*86400)
    @balance = @beginning * (1.05 ** @age)
  end

  def age
    @age.floor
  end

  def marshal_dump
    {name: @name, birthday: @birthday, beginning: @beginning}
  end

  def marshal_load(data)
    initialize(data[:name], data[:birthday], data[:beginning])
  end
end

if __FILE__ == $0
  p1 = Person.new("David", Time.now - (22 * 365 * 86400), 100)
  p [p1.name, p1.age, p1.balance]

  p2 = Marshal.load(Marshal.dump(p1))
  p [p2.name, p2.age, p2.balance]
end
