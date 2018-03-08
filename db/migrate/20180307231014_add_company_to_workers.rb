class AddCompanyToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_reference :workers, :company, foreign_key: true
  end
end
