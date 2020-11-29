user_list = [
    { user_name: "a", password: "1234" },
    { user_name: "b", password: "1234" },
    { user_name: "c", password: "1234" },
    { user_name: "d", password: "1234" },
]

puts "Welcome to authenticator"
20.times {print "-"}
puts

def auth_user(user_name, user_password, user_list)
  user_list.each do |user|
    if user[:user_name] == user_name
      return user[:password] == user_password ? "Welcome #{user[:user_name]}" : "Wrong password"
    else
      return "No user"
    end
  end
end

attempt = 0
max_attempt = 5

while (attempt < max_attempt)
  puts "Attempts leftover: #{max_attempt - attempt}"
  print "User name: "
  username = gets.chomp
  print "User password: "
  password = gets.chomp

  res = auth_user(username, password, user_list)
  puts res

  attempt += 1
end

