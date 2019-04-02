# 3 процесса ждут, пока не будут созданы файлы

def process_file(filename)
  puts "Process file #{filename}"
end

def waitfor(filename)
  loop do
    if File.exist? filename
      file_processor = Thread.new { process_file(filename) }
      Thread.exit
    else
      sleep 1
    end
  end
end

waiter1 = Thread.new { waitfor("1.txt") }
waiter2 = Thread.new { waitfor("2.txt") }
waiter3 = Thread.new { waitfor("3.txt") }

Thread.list.each{ |t| t.join if t != Thread.current }
