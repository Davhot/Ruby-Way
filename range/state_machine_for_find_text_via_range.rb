# dot -Tpng machine_state.dot -o machine_state.png

class Transition
  A, B = :A, :B
  T, F = true, false
  # state, p1, p2 => newstate, result
  Table = {[A, F, F] => [A, F], [B, F, F] => [B, T],
           [A, T, F] => [B, T], [B, T, F] => [B, T],
           [A, F, T] => [A, F], [B, F, T] => [A, T],
           [A, T, T] => [A, T], [B, T, T] => [A, T]}

  def initialize(flag1, flag2)
    @state = A
    @flag1, @flag2 = flag1, flag2
  end

  def check?(item)
    p1 = (@flag1 === item) ? T : F
    p2 = (@flag2 === item) ? T : F
    @state, result = Table[[@state, p1, p2]]
    result
  end
end

# Печать текста между =begin и =end
transition = Transition.new(/=begin/, /=end/)
file = File.open('docs.rb', 'r')
file.each_line do |line|
  puts line if transition.check?(line)
end
file.close
