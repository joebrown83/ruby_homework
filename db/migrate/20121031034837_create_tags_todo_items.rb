class CreateTagsTodoItems < ActiveRecord::Migration
  def change
    create_table :tags_todo_items, id:false do |t|
      t.references :tag
      t.references :todo_item
    end
  end
end
