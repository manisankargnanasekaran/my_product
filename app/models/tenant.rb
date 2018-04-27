class Tenant < ApplicationRecord
  belongs_to :contact
  belongs_to :address
  belongs_to :social_network
  has_many : roles
end
