class CreateFamilyBurdens < ActiveRecord::Migration[5.1]
  def change
    create_table :family_burdens do |t|
      t.string :rut
      t.string :name
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
