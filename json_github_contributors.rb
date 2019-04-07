# Программа выводит 10 авторов, привнёсших наибольший вклад в разработку
# интерпретатора Ruby

require 'json'
require 'open-uri'
require 'pp'

tempfile = open("https://api.github.com/repos/ruby/ruby/contributors")
json = tempfile.read
users = JSON.parse(json)

pp users.first

users.sort_by!{ |u| -u["contributions"] }
puts users[0..10].map{ |u| "login: #{u["login"]} contributions: #{u["contributions"]}"}
