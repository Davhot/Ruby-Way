def delete_older(dir, time)
  Dir.chdir(dir) do
    Dir.foreach(?.) do |entry|
      next if File.stat(entry).directory?
      File.unlink(entry) if File.mtime(entry) < time # удаление файла
    end
  end
end

def delete_if(dir)
  Dir.chdir(dir) do
    Dir.foreach(?.) do |entry|
      next if File.stat(entry).directory?
      File.unlink(entry) if yield entry
    end
  end
end

if $0 == __FILE__
  delete_older("1", Time.local(2018, 3, 29, 18, 38, 0))

  # Удалить все файлы больше 1000 байт
  delete_if("1"){ |f| File.size(f) > 1000 }

  # Удалить все файлы с расширениями txt и bak
  delete_if("1"){ |f| f =~ /(txt|bak)/ }
end
