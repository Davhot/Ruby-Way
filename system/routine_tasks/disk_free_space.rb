def freespace(device = ".")
  lines = %x(df -k #{device}).split("\n")
  n = (lines.last.split[3].to_f / 1024 / 1024).round(2) # Мб
end

puts freespace("/")
