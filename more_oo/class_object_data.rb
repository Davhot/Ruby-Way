class MyClass
  SOME_CONST = "alpha"
  @@var = "beta"
  @var = "gamma"

  def initialize
    @var = "delta"
  end

  def mymethod
    puts SOME_CONST
    puts @@var
    puts @var
  end

  def self.classmeth1
    puts SOME_CONST
    puts @@var
    puts @var
  end
end

def MyClass.classmeth2
  puts MyClass::SOME_CONST
  # puts @@var # вне области видимости
  puts @var
end

myobj = MyClass.new

MyClass.classmeth1
puts
MyClass.classmeth2
puts
myobj.mymethod
