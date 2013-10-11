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

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      FactoryGirl.create(:industry, name: 'Shark Wrangling')
      sign_in_as(user)
    end

    scenario 'create a company profile' do
      previous_count = Company.count

      visit new_company_path
      fill_in_company_details
      click_on 'Submit'

      expect(page).to have_content('Your company information was recorded')
      expect(Company.count).to eql(previous_count + 1)
    end

    scenario 'require all fields for profile' do
      previous_count = Company.count

      visit new_company_path
      click_on 'Submit'

      expect(page).to have_content("can't be blank")
      expect(Company.count).to eql(previous_count)
    end

    scenario 'select multiple skills needed' do
      javascript = FactoryGirl.create(:skill, name: 'Javascript')
      cpp = FactoryGirl.create(:skill, name: 'C++')
      ruby = FactoryGirl.create(:skill, name: 'Ruby')

      visit new_company_path
      fill_in_company_details

      check 'Ruby'
      check 'Javascript'
      click_on 'Submit'

      company = Company.last
      expect(company.skills).to include(ruby, javascript)
      expect(company.skills).to_not include(cpp)
    end

    def fill_in_company_details
      fill_in 'Name', with: 'Cyberdine Systems'
      fill_in 'Email', with: 'hr@cyberdine.com'
      fill_in 'City', with: 'Los Angeles'
      fill_in 'State', with: 'CA'
      fill_in 'Description', with: 'Some California company'
      check 'Telecommute'
      select 'Shark Wrangling', from: 'Industry'
      select 'Startup (1-25)', from: 'Company Size'
      fill_in 'Year founded', with: 2013
    end
  end
end
