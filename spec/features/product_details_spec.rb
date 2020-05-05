require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
    
    scenario "They click on a product and are taken to that product's detail page" do  
    
      visit root_path
      expect(page).to have_css 'article.product', count: 10

      page.find('footer.actions > a', match: :first).click
      expect(page).to have_selector 'section.products-show'

    end

  end
