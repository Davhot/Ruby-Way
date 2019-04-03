# ruby optparser.rb -h
# ruby optparser.rb --file book.txt
# ruby optparser.rb --file book.txt -l 10 print

require 'optparse'

args = {lines: 100}

OptionParser.new do |opts|
  opts.banner = "Порядок вызова: tool [options] COMMAND"

  opts.on("-f", "--file FILE") do |file|
    args[:file] = file
  end

  opts.on("-l", "--lines [LINES]", Integer,
    "Сколько строк выводить (по умочанию 100)"
  ) do |lines|
    args[:lines] = lines
  end

  opts.on_tail("-h", "--help", "Показать эту справку") do
    puts opts
    exit
  end
end.parse!

p args
p ARGV.first
