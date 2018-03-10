class Company < ApplicationRecord
  belongs_to :client
  has_many :workers
end
