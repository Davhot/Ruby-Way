require 'fileutils'
def create_directoty_with_file(directory, filename)
  Dir.mkdir directory unless File.directory?(directory)
  FileUtils.touch directory + ?/ + filename
end

def create_tree(root, depth)
  1.upto(depth) do |i|
    directory = (1..i).to_a.unshift(root).join(?/)
    create_directoty_with_file(directory, i.to_s + '.txt')
    1.upto(depth - i) do |j|
      directory_j = (1..j).to_a.unshift(directory).join(?/)
      create_directoty_with_file(directory_j, i.to_s + j.to_s + '.txt')
      1.upto(depth - j) do |k|
        directory_k = (1..k).to_a.unshift(directory_j).join(?/)
        create_directoty_with_file(directory_k, i.to_s + j.to_s + k.to_s + '.txt')
      end
    end
  end
end

def delete_all(dir)
  threads = []
  Dir.foreach(dir) do |e|
    next if ['.', '..'].include? e
    fullname = dir + ?/ + e
    if FileTest.directory?(fullname)
      threads << Thread.new(fullname) {|fn| delete_all(fn)}
    else
      File.delete(fullname)
      puts "Удален: #{fullname}"
    end
  end
  threads.each { |t| t.join }
  puts "Удаляется каталог #{dir}"
end

if $0 == __FILE__
  create_tree(Dir.pwd, 5)
  directory = Dir.pwd + "/1"
  delete_all(directory)
  FileUtils.rm_r(directory)
end
