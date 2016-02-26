class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.string :service_type
      t.integer :extra_service
      t.references :user, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :orders, [:user_id, :created_at]
    add_index :orders, [:car_id, :created_at]
  end
end
