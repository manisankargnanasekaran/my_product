class Tenant < ApplicationRecord
 
  belongs_to :contact, :dependent => :destroy
  belongs_to :address, :dependent => :destroy
  belongs_to :social_network, :dependent => :destroy
  has_many :roles

  before_save :uppercase_tenant_name

  validates :tenant_name, :tenant_location, :tenant_code, presence: true
  validates :tenant_name, :tenant_code, uniqueness: true
  
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
  accepts_nested_attributes_for :social_network, allow_destroy: true
  accepts_nested_attributes_for :roles, allow_destroy: true
 
 def uppercase_tenant_name
    tenant_name.upcase!
    self.tenant_key = SecureRandom.hex
 end

end
