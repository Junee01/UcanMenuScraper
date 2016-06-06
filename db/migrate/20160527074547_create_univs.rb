class CreateUnivs < ActiveRecord::Migration
  def change
    create_table :univs do |t|
      t.string :univ_name

      t.timestamps null: false
    end
  end
end
