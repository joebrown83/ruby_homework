#!/usr/bin/ruby

class Course
  attr_accessor :course_name, :course_id

  def initialize (course_name, course_id)
    @course_name = course_name
    @course_id = course_id
  end

  def to_s
    "#{@course_id} - #{@course_name}"
  end
end
