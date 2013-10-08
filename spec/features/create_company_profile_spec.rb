require 'spec_helper'

feature 'create company profile', %q{
  As an authenticated company
  I want to complete a profile
  So that developers can learn about me
} do

  # Acceptance Criteria:

  # * I must be able to fill in my company name, email,
  #   city, state, description(type of onboarding),
  #   telecommuting(boolean), industry(list of options),
  #   company size,  year founded

  scenario 'user creates a company profile completely' do
    previous_count = Company.count

    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on 'Add a Company'
    fill_in 'Name', with: 'Cyberdine Systems'
    fill_in 'Email', with: 'hr@cyberdine.com'
    fill_in 'City', with: 'Los Angeles'
    fill_in 'State', with: 'CA'
    fill_in 'Description', with: 'Some California company'
    check 'Telecommute'
    select 'Defense Systems', from: 'Industry'
    select 'Large', from: 'Size'  # startup, mid-sized, international conglomerate
    fill_in 'Year founded', with: 2013
    click_on 'Submit'

    expect(page).to have_content('Your company information was recorded')
    expect(Company.count).to eql(previous_count + 1)
  end

  scenario 'user tries to create a company without required fields' do
    previous_count = Company.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'Add a Company'
    click_on 'Submit'
    expect(page).to have_content("can't be blank")
    expect(Company.count).to eql(previous_count)
  end
end
