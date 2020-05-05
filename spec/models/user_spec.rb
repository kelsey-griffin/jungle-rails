require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: "name", 
                     email: "test@test.com",
                     password: "123456",
                     password_confirmation: "123456")
          }
  
  describe 'Validations' do
    
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if password and password confirmation do not match' do
      subject.password = "notpassword"
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password less than 6 characters long' do
      subject.password = "abc" 
      expect(subject).to_not be_valid
    end
  end

  
end
