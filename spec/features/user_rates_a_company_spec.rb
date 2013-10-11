require 'spec_helper'

feature 'user can rate a company',%Q{
  As a registered user
  I want to rate a company
  So that the company sees my interest in them
} do

  # ACCEPTANCE CRITERIA
  # I must be authenticated to rate a company
  # I must be able to rate a company on a scale of 1 to 5
  # If I rate a company, my reating gets saved and I get a notification
  # I can only rate a company once, and I can update my rating

  scenario 'user rates company' do
    user = FactoryGirl.create(:user)
    company = FactoryGirl.create(:company)
    initial_count = company.ratings.count
    initial_sum = company.ratings.sum('value')

    sign_in_as(user)

    visit "/companies/#{company.id}"

    fill_in 'Rating', with: 4
    click_on 'Submit'

    expect(page).to have_content('You have rated this company successfully')
    expect(company.ratings.count).to eql(initial_count + 1)
    expect(company.ratings.sum('value')).to eql(initial_sum + 4)
  end

  scenario 'user can only rate one time' do
    user = FactoryGirl.create(:user)
    company = FactoryGirl.create(:company)
    initial_count = company.ratings.count
    initial_sum = company.ratings.sum('value')

    sign_in_as(user)

    visit "/companies/#{company.id}"
    
    fill_in 'Rating', with: 4
    click_on 'Submit'

    fill_in 'Rating', with: 5
    click_on 'Submit'

    expect(page).to have_content('You have rated this company successfully')
    expect(company.ratings.count).to eql(initial_count + 1)
    expect(company.ratings.sum('value')).to eql(initial_sum + 5)
  end
end
