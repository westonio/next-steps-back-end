class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_secure_password

  before_create :generate_authentication_token!

  private

  def generate_authentication_token!
    self.authentication_token = SecureRandom.hex
  end  
end
