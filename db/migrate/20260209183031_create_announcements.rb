class CreateAnnouncements < ActiveRecord::Migration[8.1]
  def change
    create_table :announcements do |t|
      t.string :title, limit: 55
      t.string :description
      t.boolean :members_only

      t.timestamps
    end
  end
end
