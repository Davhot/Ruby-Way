# Class - это объект, Object - это класс
# В данном случае мы определяем синглтон метод для объекта, который является классом
# MyClass, тем самым определив метод класса, который является синглтон методом объекта,
# который является классом.
class MyClass
  class << self
    def hello
      puts "hello from #{self}"
    end
  end
end

MyClass.hello

str = "123"
def str.myChangeNum
  puts self.split('').map{|x| (x.to_i * 2).to_s}.join('')
end
str.myChangeNum
