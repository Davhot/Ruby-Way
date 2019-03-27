a = %w(a b c c b d a c c d)
a.each_with_object(Hash.new(0)){|x, h| h[x] += 1} #=> {"a"=>2, "b"=>2, "c"=>4, "d"=>2}
