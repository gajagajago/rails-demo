require_relative 'Bcrypt2'

class Person
  include Bcrypt2

  attr_accessor :first_name, :last_name, :age
  @@count = 0 # class variable

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @@count += 1
  end

  def to_s
    puts "#{@first_name} #{@last_name} is #{age} old."
  end

  def total
    puts "Total count: #{@@count}"
  end

  def Person.is_old(person)
    person.age > 50
  end
end

class Student < Person
  attr_accessor :first_name, :last_name, :age, :grade
  attr_reader :first_name, :last_name, :age, :grade
  # same as
  # def first_name
  #   @first_name
  # end
  attr_writer :first_name
  # same as
  # def first_name=(new_first_name)
  #   @first_name = new_first_name
  # end

  public :initialize, :to_s

  def initialize(first_name, last_name, age)
    super(first_name, last_name, age)

    @grade = age >= 20 ? "graduate" : age - 11
  end

  # virtual attribute
  def nickname
    (@first_name[0] + @last_name[0]).upcase
  end

  def to_s
    super
    puts "He is in #{@grade} grade."
  end
end

brian = Person.new("Brian", "Ryu", 12)
brian.to_s

peter = Student.new("Peter", "Ryu", 55)
peter.to_s
25.times { print "-"}
puts
puts "Peter has changed name to Paul"
25.times { print "-"}
puts
peter.first_name = "Paul"
peter.to_s
puts peter.nickname

person = Person.new("Human", "Being", 0)
person.total

puts "Is Peter old? ", Person.is_old(peter)
puts "Is Brian old? ", Person.is_old(brian)

25.times { print "-"}
puts

# puts brian.create_hash_digest(brian.age)
# to use this, include Module in class & delete self. at the module method def
