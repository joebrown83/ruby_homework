require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  @@student_base = []

  def self.students
    @@student_base = YAML.load_file("./university_db.yml")
  end
  
  def self.select_by_gender(gender)
    if @@student_base.empty?  
      students
    end
    students_by_gender = []
    @@student_base.each do |student|
      if student.gender == gender 
        students_by_gender << student
      end
    end
    students_by_gender
  end

  def self.select_by_first_name(first_name)
    if @@student_base.empty?  
      students
    end
    students_by_first_name = []
    @@student_base.each do |student|
      if student.first_name =~ first_name
        students_by_first_name << student
      end
    end
    students_by_first_name
  end

  def self.select_by_last_name(last_name)
    if @@student_base.empty?  
      students
    end
    students_by_last_name = []
    @@student_base.each do |student|
      if student.last_name =~ last_name
        students_by_last_name << student
      end
    end
    students_by_last_name
  end

  def self.select_by_weight_more_than(pounds)
    if @@student_base.empty?  
      students
    end
    students_by_weight = []
    @@student_base.each do |student|
      if student.pounds > pounds
        students_by_weight << student
      end
    end
    students_by_weight
  end
end
