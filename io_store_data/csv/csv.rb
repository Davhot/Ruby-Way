require 'csv'

CSV.open("data.csv", "w") do |wr|
  wr << ["name", "age", "salary"]
  wr << ["mark", "29", "34500"]
  wr << ["jon", "24", "50500"]
  wr << ["drake", "22", "33500"]
  wr << ["pit", "33", "39500"]
end

CSV.open("data.csv", 'r').each do |row|
  p row
end
