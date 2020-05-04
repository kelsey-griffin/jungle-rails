require 'rails_helper'

RSpec.describe Product, type: :model do
  cat1 = Category.find_or_create_by! name: 'Apparel'
  
  subject { Product.new(name: "anything", 
                        price_cents: 100, 
                        quantity: 10, 
                        category: cat1) 
          }
  describe 'Validations' do
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "is not valid without a name" do 
      subject.name = nil
      puts subject.errors.full_messages
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to_not be_empty
    end

    it "is not valid without a price" do 
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do 
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without a category" do 
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
