# Метод 1 определить метод класса через примеси
module MyModule1
  # self.included(param_class) - вызывается при вызове include данного модуля
  def self.included(param_class)
    def param_class.module_method1
      puts "Module (class) method 1"
    end
  end

  def method1
    puts "Method 1"
  end

end

class MyClass1
  include MyModule1
end

x = MyClass1.new
MyClass1.module_method1
x.method1

# Метод 2
module MyModule2
  def module_method2
    puts "Module (class) method 2"
  end
end

class MyClass1
  class << self
    include MyModule2
  end
end

MyClass1.module_method2

# Метод 3
module MyModule3
  def module_method3
    puts "Module (class) method 3"
  end
end

class MyClass1
  extend MyModule3
end

MyClass1.module_method3
