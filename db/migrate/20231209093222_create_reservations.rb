class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :tutorial, foreign_key: true
      t.date :reserve_date
      # t.string :location
      t.timestamps
    end

    add_index :reservations, [:user_id, :tutorial_id], unique: true
  end
end
