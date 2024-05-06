class CreateUserTravels < ActiveRecord::Migration[7.1]
  def change
    create_table :user_travels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
