# Если метод не найден - вызывается method_missing
class CommandWrapper
  def method_missing(method, *args)
    system(method.to_s, *args)
  end
end

cw = CommandWrapper.new
cw.date
cw.du '-sh', `pwd`.chomp
