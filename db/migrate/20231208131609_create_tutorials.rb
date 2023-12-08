class CreateTutorials < ActiveRecord::Migration[7.1]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.references :tutor, null: false, foreign_key: true
      t.integer :tutorial_price
      t.integer :scheduling_price
      t.timestamps
    end
  end
end
