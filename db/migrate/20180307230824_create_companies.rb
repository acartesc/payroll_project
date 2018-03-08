class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :taxpayer_id_company
      t.string :business_name

      t.timestamps
    end
  end
end
