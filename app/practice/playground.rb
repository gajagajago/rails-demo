first_name = "junyul"
last_name = "ryu"
float_example = 11.3

# string interpolation & method
puts "#{first_name} #{last_name} #{float_example.to_i}"
#escape by \
puts "#{first_name} #{last_name} \#{float_example.to_i}"
puts "#{first_name} said \"hello #{last_name}\""

# input from user
puts "What is your age"
# name = gets.chomp.to_i * 2
# puts "Okay. Your age times two is #{name}."

10.times{ print "-" }
puts

arr = (1..10).to_a
arr.each do |i|
  print "#{i * 10} "
end

puts

arr.each {|i| print "#{i * 10} "}

puts

arr_odd = arr.select {|number| number.odd?}
print "odds in arr_odd: ",  arr_odd

puts

arr = []
10.times {arr.push(rand(3))}
p arr
p arr.uniq!
p arr

puts
# hash
simple_hash = { 'a': 1, b: 2 }
simple_hash.each {|key, value| p "key: #{key}, value: #{value}"}
p simple_hash
simple_hash[:c] = 3
p simple_hash
string_hash = simple_hash.select {|key, value| key.is_a?(Symbol) && value <= 2}
p string_hash

string_hash.each {|key, value| simple_hash.delete(key) if value > 0}
p simple_hash

# class
class Student
  @first_name
  @last_name

  def to_s
    "Name: #{@first_name} #{@last_name}"
  end
end

junyul = Student.new
junyul.first_name = "ryu"
junyul.last_name = "junyul"
junyul.to_s



