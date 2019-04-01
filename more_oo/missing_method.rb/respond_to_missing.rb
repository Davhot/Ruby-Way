# Можно реализовывать либо method_missing, либо respond_to_missing?
class CommandWrapper
  # include_all - надо ли искать ещё и среди приватных и защищённых методов
  def respond_to_missing?(method, include_all)
    system("which #{method}")
  end
end

cw = CommandWrapper.new
p cw.respond_to?(:foo)
cw.method(:echo)
p cw.respond_to?(:echo)
