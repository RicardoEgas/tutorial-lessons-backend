class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :reserve_date
      t.references :user, null: false, foreign_key: true
      t.references :tutorial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
