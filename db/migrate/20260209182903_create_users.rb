class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, limit: 55
      t.string :address, limit: 255
      t.string :email, limit: 80
      t.integer :phone_number
      t.boolean :active
      t.date :graduation_date
      t.datetime :dues_expire

      t.timestamps
    end
  end
end
