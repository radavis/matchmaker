require 'spec_helper'

feature 'add skills to company', %q{
  As an authenticated company
  I want to be able to add skills to my profile
  So that I can tell developers what skills I'm looking for
} do

  # Acceptance Criteria:

  # * I should be able to add multiple skills to my profile

  scenario 'add a skill or more' do
    company = FactoryGirl.create(:company)
    prev_count = company.skills.count
    visit company_path(company)

    save_and_open_page
    fill_in 'Skill name', with: 'Ruby, Rails, SQL'
    click_on 'Add skills'

    expect(page).to have_content("Your skills have been added to your profile successfully")
    expect(company.skills.count).to eql(prev_count + 3)
  end
end
