class LoginDetail < ApplicationRecord
	belongs_to :tenant, optional: true
	validates :email, :password, presence: true
	has_many :users
	has_secure_password
end
