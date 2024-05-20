class AddTodoToTravels < ActiveRecord::Migration[7.1]
  def change
    add_column :travels, :todo, :text
  end
end
