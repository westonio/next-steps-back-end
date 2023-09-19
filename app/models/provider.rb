class Provider < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_secure_password
end
