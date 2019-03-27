# DES
coded = 'hfBy/T34xBEjg' # qwerty

puts "Enter password!"
print 'Password: '
password = gets.chomp

if password.crypt("hf") == coded
  puts "hello"
else
  puts "Incorrect password"
end
