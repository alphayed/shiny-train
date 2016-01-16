class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_type
      t.string :make
      t.string :model
      t.string :color
      t.string :year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :cars, [:user_id, :created_at]
  end
end
