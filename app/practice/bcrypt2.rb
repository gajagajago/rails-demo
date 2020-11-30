module Bcrypt2
  # require 'bcrypt'
  puts "Module Bcrypt2 activated!!"

  def self.create_record
    print "User name: "
    name = gets.chomp
    print "User password: "
    password = gets.chomp
    res = Hash.new
    res[:name] = name
    res[:password] = password
    return res
  end

  def self.create_hash_digest(password)
    return BCrypt::Password.create(password)
  end

  def self.create_secure_record(user_list)
    user_list.each {|user_record| user_record[:password] = create_hash_digest(user_record[:password])}
  end

  def self.verify_user(user_list)
    print "Type user name: "
    name_input = gets.chomp
    print "Type user password: "
    password_input = gets.chomp

    user_list.any? { |user_record| user_record[:name] == name_input && user_record[:password] == password_input}
  end
end

