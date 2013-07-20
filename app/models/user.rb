class User < ActiveRecord::Base
  attr_accessible :login, :password, :account, :todo_list

  has_secure_password
  has_one :account
  has_many :todo_lists
  has_many :todo_items, through: :todo_lists, source: :todo_items
end
