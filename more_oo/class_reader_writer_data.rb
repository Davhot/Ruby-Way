# Определение методов чтения и записи атрибутов класса
class MyClass
  @alpha = 123

  class << self
    attr_reader :alpha
    attr_writer :beta
    attr_accessor :gamma
  end

  def self.look
    puts "#{@alpha} #{@beta} #{@gamma}"
  end
end

puts MyClass.alpha
MyClass.beta = 456
MyClass.gamma = 789
puts MyClass.gamma
MyClass.look
