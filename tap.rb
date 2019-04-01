a = [1, 5, 1, 4, 2, 3, 4, 4, 3, 2, 5, 2, 1]
p a.sort.uniq.tap {|x| x.each{|y| p y } }.map{|x| x**2 + 2*x + 7}
