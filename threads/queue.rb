require 'thread'

buff = Queue.new # потокобезопасен
buff.enq 1
buff.enq 2
buff.enq 3
p buff.size
p buff.empty?
buff.clear
p buff.size
p buff.empty?
