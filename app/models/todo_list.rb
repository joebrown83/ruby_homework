class TodoList < ActiveRecord::Base
  belongs_to :user
  attr_accessible :list_due_date, :list_name, :todo_items

  has_many :todo_items

  default_scope order('todo_lists.list_due_date ASC')
end
