class Worker < ApplicationRecord
  belongs_to :company
  has_many :family_burdens
  has_one :health_plan
end
