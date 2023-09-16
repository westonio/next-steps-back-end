class Provider < ApplicationRecord
  validates :organization_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true, length: { is: 5 }
  validates :contact_phone, presence: true
end
