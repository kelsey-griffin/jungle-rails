require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
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

  scenario 'They click Add To Cart and their cart increases by 1' do
    
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    first('.product').find_button('Add').click
    expect(page).to have_css('a', text: 'My Cart (1)')

  end
end
