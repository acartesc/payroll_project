class AddDeductionToPensionFund < ActiveRecord::Migration[5.1]
  def change
    add_column :pension_funds, :deduction, :float
  end
end
