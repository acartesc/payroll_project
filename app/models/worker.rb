class Worker < ApplicationRecord
  belongs_to :company
  has_many :family_burdens, :dependent => :delete_all

  has_one :health_plan, :dependent => :destroy
  accepts_nested_attributes_for :health_plan

  has_one :base_salary, :dependent => :destroy
  accepts_nested_attributes_for :base_salary

  has_one :pension_fund, :dependent => :destroy
  accepts_nested_attributes_for :pension_fund
end
