class Symbol
  def to_proc
    puts "Execute #{self}"
    proc {|obj, *args| obj.send(self, *args)}
  end
end

words = %w(my words)
# & - позволяет передать proc
# интерпретатор вызывает метод to_proc объекта, не являющемся proc
puts words.map(&:capitalize).to_s
