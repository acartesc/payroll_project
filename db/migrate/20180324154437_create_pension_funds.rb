class CreatePensionFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :pension_funds do |t|
      t.string :name
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
