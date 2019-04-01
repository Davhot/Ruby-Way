# Когда модуль включается в класс, Ruby на самом деле создаёт прокси-класс,
# являющийся непосредственным родителем данного класса.
module MyMod
  def meth
    "from module: super = " + super
  end
end

class ParentClass
  def meth
    "from parent"
  end
end

class ChildClass < ParentClass
  prepend MyMod # вствка метода модуля выше метода включающего класса
  def meth
    "from child: super = " + super
  end
end

puts ChildClass.new.meth
