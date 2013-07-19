#!/usr/bin/ruby

require 'csv'
require 'yaml'
require_relative 'student'
require_relative 'course'

students = []

CSV.foreach('students.csv', headers: true) do |row|
  students << Student.new do |s|
    s.first_name = row["GivenName"]
    s.last_name = row["Surname"]
    s.city = row["City"]
    s.state = row["State"]
    s.email = row["EmailAddress"]
    s.gender = row["Gender"]
    s.pounds = row["Pounds"].to_f
    s.gpa = rand(2.0..4.0)
    s.taking_courses = []
  end 
end

students.each_index {|index| students[index].student_id = index+1}

courses = []
courses << Course.new("Intro to Rails", "605.403")
courses << Course.new("Machine Learning", "605.405")
courses << Course.new("Intro to Ruby", "605.402")
courses << Course.new("Intro to Java", "605.401")
    
students.each do |student|
  courses.each do |course|
    if (rand(10) < 5) then
      student.taking_courses << course
    end
  end
end

File.open("university_db.yml", "w") {|f| YAML.dump(students, f)}
