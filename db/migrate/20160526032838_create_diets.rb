class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.integer :univ_id
      t.string :name
      t.string :location
      t.date :date
      t.string :time
      t.text :diet
      t.text :extra

      t.timestamps null: false
    end
  end
end
