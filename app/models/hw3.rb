dial_book = {
    "newyork" => "212",
    "newbrunswick" => "732",
    "edison" => "908",
    "plainsboro" => "609",
    "sanfrancisco" => "301",
    "miami" => "305",
    "paloalto" => "650",
    "evanston" => "847",
    "orlando" => "407",
    "lancaster" => "717"
}

def get_city_names(hash)
  hash.keys.each do |key|
    puts key
  end
end

def get_area_code(hash, key)
  return hash[key]
end

puts "Do you want to look up an area code based on a city name? (Y/N)"
input = gets.chomp.downcase
return unless input == "y"
puts "Available city names: "
get_city_names(dial_book)
20.times {print "-"}
puts

loop do
  print "Enter your desired city name: "
  input = gets.chomp
  res = get_area_code(dial_book, input)

  if res
    puts "Your number is #{res}"
  else
    puts "Please try again"
  end
end

