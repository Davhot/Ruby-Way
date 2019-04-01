# Когда модуль включается в класс, Ruby на самом деле создаёт прокси-класс,
# являющийся непосредственным родителем данного класса.
module MyMod
  def meth
    "from module"
  end
end

class ParentClass
  def meth
    "from parent"
  end
end

class ChildClass < ParentClass
  include MyMod
  def meth
    "from child: super = " + super
  end
end

puts ChildClass.new.meth
