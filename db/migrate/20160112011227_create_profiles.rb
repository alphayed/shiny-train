class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :contact_email
      t.string :address
      t.string :city
      t.string :postal_code
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :profiles, [:user_id, :created_at]
  end
end
