class AddLegalBonusToRemuneration < ActiveRecord::Migration[5.1]
  def change
    add_column :remunerations, :legal_bonus, :integer
  end
end
