class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :service_type
      t.string :user_car
      t.string :extra_service
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
