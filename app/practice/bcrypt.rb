# require 'bcrypt'
# require 'io/console'

my_password = BCrypt::Password.create("daniel1004")

puts my_password # $2a$12$fPUbjZeSgZTv0nK/mP2sfebN80LQ.TF3DEyAm4/dll/54wEn6z7Pa
puts my_password == "daniel1004"

my_password = BCrypt::Password.new("$2a$12$fPUbjZeSgZTv0nK/mP2sfebN80LQ.TF3DEyAm4/dll/54wEn6z7Pa")
puts my_password == "daniel1004"

my_password1 = BCrypt::Password.new("$2a$12$fPUbjZeSgZTv0nK/mP2sfebN80LQ.TF3DEyAm4/dll/54wEn6z7Pa")
puts my_password == my_password1 # false, bcs of salt

20.times { print "-"}
puts

def create_hash_digest(password)
  first_input = BCrypt::Password.create(password)

  puts "Type your password once again"

  loop do
    if (verify_hash_digest(first_input))
      puts "Correct!"
      break
    else
      puts "Wrong! Try again"
    end
  end
end

def verify_hash_digest(first_input)
  print "Try: "
  second_input = gets.chomp
  first_input == second_input
end

print "Type your password: "
input = STDIN.noecho(&:gets).chomp
create_hash_digest(input)
