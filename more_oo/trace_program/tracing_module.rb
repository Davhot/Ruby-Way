module Tracing
  # трассировка вызываемых методов
  def self.trace_method(const, meth)
    const.class_eval do
      alias_method "untraced_#{meth}", "#{meth}"
      define_method(meth) do |*args|
        puts "Вызван метод #{meth} с параметрами (#{args.join(', ')})"
        send("untraced_#{meth}", *args)
      end
    end
  end

  # трассировка при включении модуля
  def self.included(const)
    const.instance_methods(false).each do |m|
      trace_method(const, m)
    end

    # при добавлении метода
    def const.method_added(name)
      return if @disable_method_added
      puts "Метод #{name} добавлен в класс #{self}"
      @disable_method_added = true
      Tracing.trace_method(self, name)
      @disable_method_added = false
    end

    # трассировка наследования
    if const.is_a?(Class)
      def const.inherited(name)
        puts "Класс #{name} унаследован от #{self}"
      end
    end

    if const.is_a?(Module)
      def const.extended(name)
        puts "Класс #{name} расширил себя с помощью #{self}"
      end
      def const.included(name)
        puts "Класс #{name} включил в себя #{self}"
      end
    end

    # при добавлении метода класса
    def const.singleton_method_added(name, *args)
      return if @disable_singleton_method_added
      return if name == :singleton_method_added

      puts "Метод класса #{name} добавлен в класс #{self}"
      @disable_singleton_method_added = true
      singleton_class = (class << self; self; end)
      Tracing.trace_method(singleton_class, name)
      @disable_singleton_method_added = false
    end
  end
end

class MyClass
  def first_meth
  end
end
class MyClass
  include Tracing

  def second_meth(x, y) # Метод second_meth добавлен в класс MyClass
  end
end
m = MyClass.new
m.first_meth # Вызван метод first_meth с параметрами ()
m.second_meth(1, 'nes') # Вызван метод second_meth с параметрами (1, nes)

class MyClass
  def self.a_class_method(options) # Метод класса a_class_method добавлен в класс MyClass
  end
end
MyClass.a_class_method(color: "green") # Вызван метод a_class_method с параметрами ({:color=>"green"})

class MySubClass < MyClass # Класс MySubClass унаследован от MyClass
end

module MyModule
  include Tracing
end

class MyClass
  include MyModule # Класс MyClass включил в себя MyModule
  extend MyModule # Класс MyClass расширил себя с помощью MyModule
end
