=begin
Пример:
$ ruby create_some_direcories_with_files.rb
$ ruby copy_tree.rb 1 for_copy_directory
=end

# Копирование каталога дерева
require 'fileutils'

def recurse(src, dst)
  Dir.mkdir(dst)
  Dir.foreach(src) do |e|
    next if [".", ".."].include?(e)
    fullname = src + ?/ + e
    newname = fullname.sub(Regexp.new(Regexp.escape(src)), dst)
    if File.directory?(fullname)
      recurse(fullname, newname)
    elsif File.symlink?(fullname)
      linkname = `ls -l #{fullname}`.sub(/.* -> /, "").chomp
      newlink = linkname.dup
      n = newlink.index($oldname)
      next if n == nil
      n2 = n + $oldname.size - 1
      newlink[n .. n2] = $newname
      newlink.sub!(/\/\//, ?/)
      File.symlink(newlink, newname)
    elsif File.file?(fullname)
      FileUtils.copy(fullname, newname)
    else
      puts "???: #{fullname}"
    end
  end
end

if $0 == __FILE__
  if ARGV.size != 2
    puts "Порядок вызова: copytree oldname newname"
    exit
  end

  oldname = ARGV[0]
  newname = ARGV[1]

  unless File.directory?(oldname)
    puts "Error #{oldname} is not directory"
    exit
  end

  if File.exist?(newname)
    puts "Error #{newname} already exist!"
    exit
  end

  oldname = File.expand_path(oldname)
  newname = File.expand_path(newname)

  $oldname = oldname
  $newname = newname

  recurse(oldname, newname)
end
