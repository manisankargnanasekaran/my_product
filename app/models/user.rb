class User < ApplicationRecord
  belongs_to :contact
  belongs_to :address
  belongs_to :social_network
  belongs_to :role
  belongs_to :tenant
end
