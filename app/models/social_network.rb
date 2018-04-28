class SocialNetwork < ApplicationRecord
	has_one :tenant
	has_many :users
end
