class CreateBaseSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :base_salaries do |t|
      t.integer :amount
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
