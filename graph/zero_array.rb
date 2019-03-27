class ZeroArray < Array
  def [](x)
    if x > size
      (size+1..x).each{ |i| self[i] = 0 }
    end
    v = super(x)
  end

  def []=(x, v)
    max = size
    super(x, v)
    if size - max > 1
      (max..size-2).each { |i| self[i] = 0 }
    end
  end
end

if $0 == __FILE__
  a = ZeroArray.new
  a[5] = 'a'
  puts a
end
