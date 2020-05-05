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

  describe '.authenticate_with_credentials' do
    
    it 'validates email as case insensitive' do
      subject.save

      user = User.authenticate_with_credentials(subject.email.upcase, subject.password)
      expect(user).to be_instance_of(User)
      expect(user.id).to eql(subject.id)
    end


    it 'trims whitespace around email input' do
      subject.email = "  test@test.com"
      subject.save
      
      user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(subject.email).to match("test@test.com")
    end
  end  

end
