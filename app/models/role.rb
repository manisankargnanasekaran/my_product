class Role < ApplicationRecord
  belongs_to :tenant
  has_many :users
  
  accepts_nested_attributes_for :users, allow_destroy: true


  validates :role_name, :role_code, presence: true
  

end
