require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :music, :place, :color

  def initialize
    self.get_person_info
  end

  def self.create_person(type)
    case type
    when "Student"
      Student.new
    when "Instructor"
      Instructor.new
    end
  end

  def get_person_info
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "Favorite color: "
    self.color = gets.strip.chomp
    print "What is your favorite band? "
    self.music = gets.strip.chomp
    print "If you could go on a vacation anywhere, where would you go? "
    self.place = gets.strip.chomp
  end
end

class Student < Person
  attr_accessor :reason_for_joining

  def get_person_info
    super
    print "Why did you join this class? "
    self.reason_for_joining = gets.strip.chomp 
  end
end

class Instructor < Person
  attr_accessor :type
  def get_person_info
    super
    print "What sort of instructor are you? "
    self.type = gets.strip.chomp
  end
end

@directory = ""
puts "Student Directory, v0.0.2 by Dan Garland & Todd Burner"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do
  unless input == 'Student'|| input == 'Instructor'
    print "Enter Student or Instructor: "
    next
  end
  
  person = Person.create_person(input)

  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
