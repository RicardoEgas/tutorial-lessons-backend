class CreateTutorials < ActiveRecord::Migration[7.1]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.integer :tutorial_price
      t.integer :scheduling_price

      t.timestamps
    end
  end
end
