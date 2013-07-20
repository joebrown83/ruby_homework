require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  @@student_base = []

  def self.method_missing(method, *args)
    if @@student_base.empty?
      @@student_base = YAML.load_file("./university_db.yml")
    end
    student_list = []
    method =~ /^select_students_where_(.*)/
    method = $1
    @@student_base.each do |student|
      if student.send("#{method}").send(args[0], args[1])
        student_list << student
      end
    end
    student_list
  end

end
