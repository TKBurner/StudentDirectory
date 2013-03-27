require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :music, :place, :color

  def self.create_person(type)
    case type
    when "Student"
      Student.new
    when "Instructor"
      Instructor.new
    end
  end
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

@directory = ""
puts "Student Directory, v0.0.2 by Dan Garland & Todd Burner"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do
  unless input == 'Student'|| input == 'Instructor'
    print "Enter Student or Instructor: "
    next
  end
  person = nil
  
  person = Person.create_person(input)
  print "What is your name? "
  person.name = gets.strip.chomp
  print "What is your email? "
  person.email = gets.strip.chomp
  print "Favorite color: "
  person.color = gets.strip.chomp
  print "What is your favorite band? "
  person.music = gets.strip.chomp
  print "If you could go on a vacation anywhere, where would you go? "
  person.place = gets.strip.chomp

  case input
  when 'Student'  
    print "Why did you join this class? "
    person.reason_for_joining = gets.strip.chomp  

    
  when 'Instructor'
    print "What sort of instructor are you? "
    person.type = gets.strip.chomp
  end
  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
