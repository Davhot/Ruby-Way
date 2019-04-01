module Quantifier
  def two?
    2 == self.select{ |x| yield x }.size
  end

  def four?
    4 == self.select{ |x| yield x }.size
  end
end

list = [1, 2, 3, 4, 5]
list.extend(Quantifier)

p list.two?{|x| x > 3}
p list.two?{|x| x >= 3}
p list.four?{|x| x <= 4}
p list.four?{|x| x % 2 == 0}
