require './tri_matrix'
require './zero_array'
# Неориентированный граф. Рёбра хранятся в матрице смежности LowerMatrix.
class LowerMatrix < TriMatrix
  def initialize
    @store = ZeroArray.new
  end
end

class Graph
  def initialize(*edges)
    @store = LowerMatrix.new
    @max = 0
    for e in edges
      e[0], e[1] = e[1], e[0] if e[1] > e[0]
      @store[e[0], e[1]] = 1
      @max = [@max, e[0], e[1]].max
    end
  end

  def [](x, y)
    if x > y
      @store[x, y]
    elsif x < y
      @store[y, x]
    else
      0
    end
  end

  def []=(x, y, v)
    if x > y
      @store[x, y] = v
    elsif x < y
      @store[y, x] = v
    else
      0
    end
  end

  def edge?(x, y)
    x, y = y, x if x < y
    @store[x, y] == 1
  end

  def add(x, y)
    @store[x, y] = 1
  end

  def remove(x, y)
    x, y = y, x if x < y
    @store[x, y] = 0
    if degree(@max) == 0
      @max -= 1
    end
  end

  def vmax
    @max
  end

  def count_vertexes
    vmax + 1
  end

  def degree(x)
    (0..@max).to_a.inject(0){ |sum, i| sum += (self[x, i] || 0) }
  end

  def each_vertex
    (0..@max).each{ |v| yield v }
  end

  def each_edge
    for v0 in 0 .. @max
      for v1 in 0 .. v0-1
        yield v0, v1 if self[v0, v1] == 1
      end
    end
  end

  # смежные вершины с v
  def incident_vertexes(v)
    (0..@max).to_a.select{|i| self[v, i] == 1}
  end

  # рекурсивный обход вглубину для поиска пути из a в b.
  def has_path?(a, b, visited = [])
    return true if a == b
    visited[a] = true
    for v in incident_vertexes(a)
      unless visited[v]
        return true if has_path?(v, b, visited)
      end
    end
    false
  end

  # Проверка на связность (поиск в ширину)
  def connected?
    visited = []
    begin_vertex = 0
    visited[begin_vertex] = true
    i_v = incident_vertexes(begin_vertex)
    while i_v.any?
      current_vertex = i_v.shift
      puts current_vertex
      visited[current_vertex] = true
      incident_vertexes(current_vertex).each do |v|
        i_v << v unless visited[v]
      end
    end
    visited.count(true) == count_vertexes
  end

  def get_store
    @store.store
  end
end


if $0 == __FILE__
  myGraph = Graph.new([0,1], [0, 2] [0,3])
  puts myGraph.get_store.to_s
  # Степени вершин
  myGraph.each_vertex{ |v| puts myGraph.degree(v) }
  # Список рёбер
  myGraph.each_edge do |a,b|
    puts "(#{a},#{b})"
  end

  puts
  puts myGraph.incident_vertexes(1).to_s
  puts myGraph.has_path?(1, 0)
  puts myGraph.connected?
end
