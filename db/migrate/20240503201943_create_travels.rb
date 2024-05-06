class CreateTravels < ActiveRecord::Migration[7.1]
  def change
    create_table :travels do |t|
      t.string :country
      t.string :city
      t.string :climate
      t.integer :iswater
      t.integer :ismount
      t.text :description
      t.string :city_image

      t.timestamps
    end
  end
end
