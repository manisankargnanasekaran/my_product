class Address < ApplicationRecord
	has_one :tenant
	has_many :users
end
