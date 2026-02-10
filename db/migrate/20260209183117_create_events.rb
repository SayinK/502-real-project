class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name, limit: 55
      t.string :location, limit: 55
      t.boolean :members_only

      t.timestamps
    end
  end
end
