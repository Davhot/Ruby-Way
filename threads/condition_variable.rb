require 'thread'

@music = Mutex.new
@violin = ConditionVariable.new
@bow = ConditionVariable.new

@violins_free = 2
@bows_free = 1

def musicians(n)
  loop do
    sleep rand(n)
    @music.synchronize do
      @violin.wait(@music) while @violins_free == 0 # музыкант засыпает, пока не станет доступна скрипка
      @violins_free -= 1
      puts "#{n} владеет скрипкой"
      puts "скрипок #{@violins_free}, смычков #{@bows_free}"

      @bow.wait(@music) while @bows_free == 0 # музыкант засыпает, пока не станет доступен смычок
      @bows_free -= 1
      puts "#{n} владеет смычком"
      puts "скрипок #{@violins_free}, смычков #{@bows_free}"
    end
    sleep rand(n)
    puts "#{n}: (...играет...)"
    sleep rand(n)
    puts "#{n} закончил играть."

    @music.synchronize do
      @violins_free += 1
      @violin.signal if @violins_free == 1
      @bows_free += 1
      @bow.signal if @bows_free == 1
    end
  end
end

threads = []
3.times{|i| threads << Thread.new { musicians(i) }}

threads.each{|t| t.join}
