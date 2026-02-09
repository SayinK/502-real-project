class CreateAdministrators < ActiveRecord::Migration[8.1]
  def change
    create_enum :administrator_rank, [ "officer", "president" ]

    create_table :administrators, id: false do |t|
      t.references :user, null: false, type: :uuid, foreign_key: true, primary_key: true
      t.enum :rank, enum_type: :administrator_rank, null: false

      t.timestamps
    end
  end
end
