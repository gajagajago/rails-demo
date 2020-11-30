# # referencing a module
# require_relative 'Bcrypt2'
#
# i = 0
# user_list = []
#
# while (i < 4)
#   user_list.push(Bcrypt2.create_record)
#   i += 1
# end
#
# Bcrypt2.create_secure_record(user_list)
# user_list.each { |user_record| p (user_record[:name] + ' : ' + user_record[:password]) }
#
# loop do
#   res = Bcrypt2.verify_user(user_list)
#   if (res)
#     puts "CORRECT!"
#     break
#   else
#     puts "Please try again :("
#   end
# end