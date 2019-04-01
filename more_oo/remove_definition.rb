# remove_const и remove_method являются закрытыми, поэтому вызываются внутри класса/модуля
def some_f; puts "!" end

undef some_f

begin
  some_f
rescue Exception => e
  puts "Теперь нет some_f!"
end

class Parent
  def alpha
    puts "Alpha Parent"
  end
  def beta
    puts "Beta Parent"
  end
end

class Child < Parent
  def alpha
    puts "Alpha Child"
  end
  def beta
    puts "Beta Child"
  end

  remove_method :alpha # Удалить "этот alpha"
  undef_method :beta # Удалить все beta
end

x = Child.new

x.alpha
begin
  x.beta
rescue Exception => e
  puts "Теперь нет x.beta!"
end

include Math
module Math
  remove_const :PI
end

begin
  Math::PI
rescue Exception => e
  puts "Теперь нет Math::PI!"
end
