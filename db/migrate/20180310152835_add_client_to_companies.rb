class AddClientToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :client, foreign_key: true
  end
end
