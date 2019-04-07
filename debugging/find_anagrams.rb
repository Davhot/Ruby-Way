# ruby -rprofile find_anagrams.rb
words = File.readlines("/usr/share/dict/words")
words.map!{ |x| x.chomp }

hash = {}

words.each do |word|
  key = word.split('').sort.join
  hash[key] ||= []
  hash[key] << word
end

sizes = hash.values.map{ |v| v.size }
most = sizes.max
list = hash.find_all { |k, v| v.size == most }

puts "Ни у одного слова нет больше #{most-1} анаграмм"
list.each do |key, val|
  anagrams = val.sort
  first = val.sort
  puts "Слово #{first} имеет #{most-1} анаграмм:"
  anagrams.each{ |a| puts "\t#{a}"}
end

num = 0
hash.keys.each do |key|
  n = hash[key].size
  num += n if n > 1
end

puts "Всего в словаре #{words.size} слов"
puts "Из них имеют анаграммы: #{num}"
