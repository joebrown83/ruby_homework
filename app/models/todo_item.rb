class TodoItem < ActiveRecord::Base
  attr_accessible :description, :due_date, :task_title, :done
  belongs_to :todo_list
  has_and_belongs_to_many :tags

  default_scope order('todo_items.due_date ASC')
end
