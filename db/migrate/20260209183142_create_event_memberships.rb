class CreateEventMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :event_memberships, id: false do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
