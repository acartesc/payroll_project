class CreateRemunerations < ActiveRecord::Migration[5.1]
  def change
    create_table :remunerations do |t|
      t.date :month
      t.string :business_name
      t.string :taxpayer_id_company
      t.string :worker_rut
      t.string :worker_name
      t.string :pension_fund_name
      t.float :pension_fund_deduction
      t.string :health_plan_name
      t.float :health_plan_deduction
      t.integer :base_salary
      t.integer :absence
      t.integer :extra_hour
      t.integer :family_burden
      t.integer :taxable
      t.integer :bonus
      t.integer :advance_payment
      t.integer :tax_base
      t.integer :food_allowance
      t.integer :transportation_allowance
      t.integer :non_tax_base
      t.integer :total_legal_discount
      t.integer :pension_fund_discount
      t.integer :health_discount
      t.integer :unique_tax_discount
      t.integer :unemployment_insurance
      t.integer :total_legal_discount
      t.integer :advance_payment_discount
      t.integer :total_other_discount
      t.integer :total_asset
      t.integer :total_discount
      t.integer :net_pay
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
