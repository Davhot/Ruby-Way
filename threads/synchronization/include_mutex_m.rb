require 'mutex_m'

class MyClass
  include Mutex_m

  # Любой объект класса MyClass может вызывать методы lock, unlock, synchronize, ...
  # Внешние объекты также могут вызывать эти методы для объекта MyClass
end
