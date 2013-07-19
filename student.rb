#!/usr/bin/ruby

class Student
  attr_accessor :student_id, :first_name, :last_name, :city, :state, :email, :gender, :pounds, :gpa, :taking_courses

  def initialize
    yield self if block_given?
  end

  def to_s
    if taking_courses.empty?
      "Name: #{first_name} #{last_name} (#{gender} from #{city}, #{state}, weight: #{pounds}, GPA: #{gpa})"
    else
      "Name: #{first_name} #{last_name} (#{gender} from #{city}, #{state}, weight: #{pounds}, GPA: #{gpa}) \n\tCourses: #{taking_courses.join(", ")} "
    end
  end
end
