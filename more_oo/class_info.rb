include Math
puts "список всех предков: #{Array.ancestors}"
puts "Math.constants: #{Math.constants}"

class Parent
  @@var1 = nil
end
class Child < Parent
  @@var2 = nil

  def initialize
    @a = 1
    @b = 2
  end
end

puts "Переменные класса: #{Parent.class_variables}"
puts "Подлючённые модули Array: #{Array.included_modules}"

puts "Открытые методы Array (синоним public_instance_methods) (учитываются методы суперкласса): #{Array.instance_methods.size}"
puts "Открытые методы Array (синоним public_instance_methods) (не учитываются методы суперкласса): #{Array.instance_methods(false).size}"
puts "Protected методы Array: #{Array.protected_instance_methods(false).size}"
puts "Private методы Array: #{Array.private_instance_methods(false).size}"

puts "Переменные экземпляра: #{Child.new.instance_variables}"
