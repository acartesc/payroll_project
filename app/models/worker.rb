class Worker < ApplicationRecord
  belongs_to :company
  has_many :family_burdens
  has_one :health_plan
  accepts_nested_attributes_for :health_plan
end
