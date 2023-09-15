require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:organization_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:contact_phone) }
    it { should validate_length_of(:state).is_equal_to(2) }
    it { should validate_length_of(:zip).is_equal_to(5) }
  end
end
