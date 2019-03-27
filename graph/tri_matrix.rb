# треугольная матрица (элемент (x, y) = (y, x))
# значения хранятся в одномерном массиве.
# Элементы получаем по формуле (x^2 + x) / 2 + y
class TriMatrix
  attr_reader :store
  def initialize
    @store = []
  end

  def [](x, y)
    if x > y
      index = (x*x+x)/2 + y
      @store[index]
    else
      raise IndexError
    end
  end

  def []=(x, y, v)
    if x > y
      index = (x*x+x)/2 + y
      @store[index] = v
    else
      raise IndexError
    end
  end
end

if $0 == __FILE__
  t = TriMatrix.new
  for i in 0 ... 10 do
    for j in i + 1 ... 10 do
      t[j, i] = "i: #{j} | j: #{i}"
    end
  end
  t.store.each{|x| puts "elem: #{x}"}
end
