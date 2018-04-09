class Remuneration < ApplicationRecord
  belongs_to :worker

  before_save :calculate_tax_base, :calculate_taxable, :calculate_total_legal_discount,
  :calculate_non_tax_base, :calculate_total_other_discount, :calculate_totals

  def calculate_pension_fund_discount
    worker.base_salary_amount * (worker.pension_fund.deduction / 100)
  end

  def calculate_health_plan_discount
    worker.base_salary_amount * (worker.health_plan.deduction / 100)
  end

  def calculate_unemployment_insurance_discount
    worker.base_salary_amount * (0.6/100)
  end

  def calculate_assistance
    30 - absence.to_i
  end

  def calculate_tax_base
    amount = worker.base_salary_amount
    amount += bonus if bonus
    amount += extra_hour if extra_hour
    amount += advance_payment if advance_payment
    amount += legal_bonus if legal_bonus
    self.tax_base = amount
  end

  def calculate_taxable
    amount = 0
    amount += tax_base if tax_base
    amount -= pension_fund_discount if pension_fund_discount
    amount -= health_discount if health_discount
    amount -= unemployment_insurance if unemployment_insurance
    self.taxable = amount
  end

  def calculate_total_legal_discount
    amount = 0
    amount += pension_fund_discount if pension_fund_discount
    amount += health_discount if health_discount
    amount += unique_tax_discount if unique_tax_discount
    amount += unemployment_insurance if unemployment_insurance
    self.total_legal_discount = amount
  end

  def calculate_non_tax_base
    amount = 0
    amount += food_allowance if food_allowance
    amount += transportation_allowance if transportation_allowance
    self.non_tax_base = amount
  end

  def calculate_total_other_discount
    amount = 0
    amount +=  advance_payment_discount if advance_payment_discount
    self.total_other_discount = amount
  end

  def calculate_totals
    self.total_asset = tax_base + non_tax_base
    self.total_discount = total_legal_discount + total_other_discount
    self.net_pay = total_asset - total_discount
  end

end
