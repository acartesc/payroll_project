class Worker < ApplicationRecord
  belongs_to :company
  has_many :family_burdens, :dependent => :delete_all

  has_one :health_plan, :dependent => :destroy
  accepts_nested_attributes_for :health_plan

  has_one :base_salary, :dependent => :destroy
  accepts_nested_attributes_for :base_salary

  has_one :pension_fund, :dependent => :destroy
  accepts_nested_attributes_for :pension_fund

  has_many :remunerations, :dependent => :delete_all

  def full_name
    first_name + " " + middle_name + " " + last_name1 + " " + last_name2
  end

  def company_details
    {name: company.business_name, rut: company.taxpayer_id_company}
  end

  def health_plan_details
    {name: health_plan.name, deduction: health_plan.deduction}
  end

  def base_salary_amount
    base_salary.amount
  end

  mount_uploader :file, FileUploader

end
