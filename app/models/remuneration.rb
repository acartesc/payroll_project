class Remuneration < ApplicationRecord
  belongs_to :worker

  def calculate_tax_base
    worker.base_salary_amount + bonus + extra_hour
  end

end
