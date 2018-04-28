class User < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :address, optional: true
  belongs_to :social_network, optional: true
  belongs_to :role
  belongs_to :login_detail
  
  before_save :secure_key_generate

  validates :salutation, :first_name, :last_name, :user_name, presence: true
  
  

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
  accepts_nested_attributes_for :social_network, allow_destroy: true
  accepts_nested_attributes_for :login_detail, allow_destroy: true
  accepts_nested_attributes_for :role, allow_destroy: true

  def secure_key_generate
     user_name.upcase!
     self.user_key = SecureRandom.hex
 end

end
