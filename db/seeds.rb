# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Account.delete_all
Tag.delete_all
TodoList.delete_all
TodoItem.delete_all
TodoItem.delete_all

User.create [
  {login: "jbrown", password: "usa1776"},
  {login: "janesmith", password: "test1234"},
  {login: "Matt", password: "abc123"},
  {login: "Tim", password: "abc123"}
]

Account.create [
  {gender: "male", age: 29, first_name: "Joe", last_name: "Brown"},
  {gender: "female", age: 30, first_name: "Jane", last_name: "Smith"},
  {gender: "male", age: 49, first_name: "Matt", last_name: "Jones"},
  {gender: "male", age: 24, first_name: "Tim", last_name: "Johnson"}
]

Tag.create [
  {tag_name: "business trips"},
  {tag_name: "vacations"},
  {tag_name: "chores"}
]

TodoList.create [
  {list_name: "traveling", list_due_date: '2013-12-31'},
  {list_name: "cleaning", list_due_date: '2012-11-15'},
  {list_name: "cooking", list_due_date: '2012-11-22'},
  {list_name: "reading", list_due_date: '2013-10-30'},
  {list_name: "programming", list_due_date: '2013-12-31'},
  {list_name: "shopping", list_due_date: '2012-12-25'},
  {list_name: "groceries", list_due_date: '2012-12-25'}
]

TodoItem.create [
  {done: 0, due_date: '2012-12-31', task_title: "New York", description: "Visit New York City"},
  {done: 0, due_date: '2013-04-30', task_title: "Paris", description: "Visit Paris in the spring"},
  {done: 1, due_date: '2013-04-30', task_title: "Chicago", description: "Convention in Chicago"},
  {done: 0, due_date: '2012-11-5', task_title: "Kitchen", description: "Clean kitchen counters"},
  {done: 1, due_date: '2012-11-9', task_title: "Living room", description: "Dust living room"},
  {done: 0, due_date: '2012-11-10', task_title: "Dog", description: "Give dog a bath"},
  {done: 1, due_date: '2012-11-22', task_title: "Soup", description: "Make potato soup"},
  {done: 0, due_date: '2012-11-22', task_title: "Turkey", description: "Roast turkey"},
  {done: 1, due_date: '2012-11-22', task_title: "Pie", description: "Bake pumpkin pie"},
  {done: 0, due_date: '2012-11-22', task_title: "Green Beans", description: "Cook green beans"},
  {done: 0, due_date: '2012-11-22', task_title: "Cake", description: "Bake chocolate cake"},
  {done: 1, due_date: '2012-11-22', task_title: "Mac and Cheese", description: "Cook mac and cheese"},
  {done: 0, due_date: '2012-11-22', task_title: "Rolls", description: "Bake dinner rolls"},
  {done: 1, due_date: '2012-11-22', task_title: "Potatoes", description: "Make mashed potatoes"}
]

User.find_by_login("jbrown").account = Account.find_by_last_name("Brown")
User.find_by_login("janesmith").account = Account.find_by_last_name("Smith")
User.find_by_login("Matt").account = Account.find_by_last_name("Jones")
User.find_by_login("Tim").account = Account.find_by_last_name("Johnson")

User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("traveling")
User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("cleaning")
User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("reading")
User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("programming")
User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("shopping")
User.find_by_login("Matt").todo_lists << TodoList.find_by_list_name("groceries")
User.find_by_login("Tim").todo_lists << TodoList.find_by_list_name("cooking")

TodoList.find_by_list_name("traveling").todo_items << TodoItem.find_by_task_title("New York")
TodoList.find_by_list_name("traveling").todo_items << TodoItem.find_by_task_title("Paris")
TodoList.find_by_list_name("traveling").todo_items << TodoItem.find_by_task_title("Chicago")
TodoList.find_by_list_name("cleaning").todo_items << TodoItem.find_by_task_title("Kitchen")
TodoList.find_by_list_name("cleaning").todo_items << TodoItem.find_by_task_title("Living room")
TodoList.find_by_list_name("cleaning").todo_items << TodoItem.find_by_task_title("Dog")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Soup")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Turkey")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Pie")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Green Beans")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Cake")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Mac and Cheese")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Rolls")
TodoList.find_by_list_name("cooking").todo_items << TodoItem.find_by_task_title("Potatoes")

business_trips = Tag.find_by_tag_name("business trips")
vacations = Tag.find_by_tag_name("vacations")
chores = Tag.find_by_tag_name("chores")

vacations.todo_items << TodoItem.find_by_task_title("New York")
vacations.todo_items << TodoItem.find_by_task_title("Paris")
business_trips.todo_items << TodoItem.find_by_task_title("Chicago")
chores.todo_items << TodoItem.find_by_task_title("Kitchen")
chores.todo_items << TodoItem.find_by_task_title("Living room")
chores.todo_items << TodoItem.find_by_task_title("Dog")
chores.todo_items << TodoItem.find_by_task_title("Soup")
chores.todo_items << TodoItem.find_by_task_title("Turkey")
chores.todo_items << TodoItem.find_by_task_title("Pie")
chores.todo_items << TodoItem.find_by_task_title("Green Beans")
chores.todo_items << TodoItem.find_by_task_title("Cake")
chores.todo_items << TodoItem.find_by_task_title("Mac and Cheese")
chores.todo_items << TodoItem.find_by_task_title("Rolls")
chores.todo_items << TodoItem.find_by_task_title("Potatoes")
