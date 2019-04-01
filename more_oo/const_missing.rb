# Если не найдена константа, то вызывается метод const_missing
require_relative '../range/roman.rb'
class Roman
  def self.const_missing(name)
    Roman.decode(name.to_s)
  end
end

p Roman::XX
