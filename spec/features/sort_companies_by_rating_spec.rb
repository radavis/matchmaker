require 'spec_helper'

feature 'sort companies by rating', %q{
  As an authenticated user
  I want to see companies ordered by rating
  So that I can learn about the highest rated companies
} do

  # Acceptance Criteria:

  # * I should see a list of companies
  # * Companies should be ordered by rating

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      ebay = FactoryGirl.create(:company, name: 'eBay')
      FactoryGirl.create(:rating, company_id: ebay.id, value: 2)

      fireball = FactoryGirl.create(:company, name: 'Fireball')
      FactoryGirl.create(:rating, company_id: fireball.id, value: 5)

      linkedin = FactoryGirl.create(:company, name: 'LinkedIn')
      FactoryGirl.create(:rating, company_id: linkedin.id, value: 3)
      sign_in_as(user)
    end

    scenario 'visit the index page for companies' do
      visit companies_path
      expect(page).to have_content("ul li:nth-child(1)", content: 'Fireball')
      expect(page).to have_content("ul li:nth-child(2)", content: 'LinkedIn')
      expect(page).to have_content("ul li:nth-child(3)", content: 'eBay')
    end
  end
end
