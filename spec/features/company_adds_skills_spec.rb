require 'spec_helper'

feature 'add skills to company', %q{
  As an authenticated company
  I want to be able to add skills to my profile
  So that I can tell developers what skills I'm looking for
} do

  # Acceptance Criteria:

  # * I should be able to add multiple skills to my profile

  pending 'add a skill or more' do
    company = FactoryGirl.create(:company)
    prev_count = company.skills.count
    visit company_path(company)

    fill_in 'Skill name', with: 'Ruby'
    click_on 'Add skills'

    expect(page).to have_content("Your skills have been added to your profile successfully")
    expect(company.skills.count).to eql(prev_count + 1)
  end

  scenario 'add a skill or more' do
    company = FactoryGirl.create(:company)
    javascript = FactoryGirl.create(:skill, name: 'Javascript')
    cpp = FactoryGirl.create(:skill, name: 'C++')
    ruby = FactoryGirl.create(:skill, name: 'Ruby')

    prev_count = company.skills.count
    visit company_path(company)

    check 'Ruby'
    check 'Javascript'
    click_on 'Add skills'

    expect(page).to have_content("Your skills have been added to your profile successfully")
    expect(company.skills).to include(ruby, javascript)
    expect(company.skills).to_not include(cpp)
    expect(company.skills.count).to eql(prev_count + 2)
  end

  pending 'only company unique skills can be added' do
    company = FactoryGirl.create(:company)
    prev_count = company.skills.count
    visit company_path(company)

    fill_in 'Skill name', with: 'Ruby'
    click_on 'Add skills'

    expect(page).to have_content("Your skills have been added to your profile successfully")

    fill_in 'Skill name', with: 'Ruby'
    click_on 'Add skills'

    expect(company.skills.count).to eql(prev_count + 1)
    expect(page).to have_content('Ruby')
  end
end
