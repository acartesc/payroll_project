class Remuneration < ApplicationRecord
  belongs_to :worker

  def calculate_tax_base
    worker.base_salary_amount + bonus + extra_hour
  end

  def calculate_pension_fund_discount
    worker.base_salary_amount * (worker.pension_fund.deduction / 100)
  end

  def calculate_health_plan_discount
    worker.base_salary_amount * (worker.health_plan.deduction / 100)
  end

  def calculate_unemployment_insurance_discount
    worker.base_salary_amount * (0.6/100)
  end

end
