# Если в initialize передаётся много аргументов
class PersonalComputer
  PARAMS = %w(manufacturer model processor clock ram disk monitor colors vres
    hres net)
  attr_reader *PARAMS

  def initialize(&block)
    instance_eval(&block)
  end

  def to_s
    "#{model} #{ram} #{disk} #{processor}"
  end

  protected

  attr_writer *PARAMS
end

pc = PersonalComputer.new do
  self.manufacturer = "Acme"
  self.model = "123"
  self.processor = "Intel"
  self.clock = "9.6"
  self.ram = 16
  self.disk = 256
  self.monitor = 25
  self.colors = "WHITE"
  self.vres = 1280
  self.hres = 1600
  self.net = "T3"
end

p pc.disk

puts pc

begin
  pc.disk = 300
rescue Exception => e
  puts "Error message: #{e.message}"
end
