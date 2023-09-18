require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:phone) }
    it { should validate_length_of(:state).is_equal_to(2) }
    it { should validate_length_of(:zipcode).is_equal_to(5) }
  end

  describe "password hashing" do
    it "hashes the password using BCrypt" do
      provider =
        Provider.create!(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule",
          username: "test",
          password: "test"
        )

      expect(BCrypt::Password.new(provider.password_digest)).to eq("test")
      expect(provider.password_digest).not_to eq("test")
      expect(provider.password_digest).not_to be_nil
    end

    it "does not save passwords in plain text" do
      provider =
        Provider.create!(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule",
          username: "test",
          password: "test"
        )

      expect(provider.password_digest).not_to eq("test")
      expect(provider.password_digest).not_to be_nil
      expect(provider.password_digest).to be_a(String)
    end

    it "authenticates a provider with a valid password" do
      password = "test"
      provider =
        Provider.create!(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule",
          username: "test",
          password: "test"
        )

      expect(provider.authenticate(password)).to eq(provider)
      expect(provider.authenticate(password)).to be_a(Provider)
      expect(provider.authenticate(password).username).to eq("test")
      expect(provider.authenticate(password).password_digest).to eq(provider.password_digest)
    end

    it "does not authenticate a provider with an invalid password" do
      correct_password = "test" 
      incorrect_password = "wrong"
      provider =
      Provider.create!(
        name: "Test Organization",
        description: "Test Description",
        street: "123 Test St",
        city: "Test City",
        state: "TX",
        zipcode: "12345",
        website: "https://www.test.com",
        phone: "123-456-7890",
        fees: "Test Fees",
        schedule: "Test Schedule",
        username: "test",
        password: "test"
      )

      expect(provider.authenticate(incorrect_password)).to eq(false)
    end
  end
end
