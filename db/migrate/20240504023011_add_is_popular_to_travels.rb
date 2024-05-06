class AddIsPopularToTravels < ActiveRecord::Migration[7.1]
  def change
    add_column :travels, :ispopular, :integer
  end
end
