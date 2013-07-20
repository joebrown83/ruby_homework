require_relative '../config/environment'

joe = User.find_by_login "jbrown"
puts "Joe's account information"
puts joe.account.to_s

puts "\nJoe's to do lists in order of due date"
puts joe.todo_lists.to_s

puts "\nJoe's to do items in order of due date (Showing TodoItems map to User)"
puts joe.todo_items.to_s

puts "\nShow validation"
bob = Account.create(first_name: "Bob", last_name: "Jones", age: "test", gender: "test")
puts bob.errors.messages.to_s
bob.age = 40
bob.gender = "male"
bob.save
puts "\n"
puts Account.all
