class CreateHealthPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :health_plans do |t|
      t.string :name
      t.float :deduction
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
