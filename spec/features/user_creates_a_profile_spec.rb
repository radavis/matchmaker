require 'spec_helper'

feature 'user creates a profile', %q{
  As an authenticated user
  I want to create a profile
  So that companies and developers can learn about me
} do

  # Acceptance Criteria:

  # * I must be an authenticated user
  # * A user should have only one profile
  # * If all information is specified, it is saved
  # * User gets a message when their profile is updated or created
  # * User gets an error message if information is missing
  # * I must be able to specify first name, last name, city, state, willing to relocate

  it 'lets a user create a profile' do
    previous_count = Profile.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit root_path
    click_on "Create Profile"

    fill_in "First name", with: "Richard"
    fill_in "Last name", with: "Beastmaster"
    fill_in "City", with: "Boston"
    select "Massachusetts", from: "State"
    fill_in "Linkedin", with: "http://www.linkedin.com/davisra"
    fill_in "Github", with: "http://www.github.com/radavis"
    fill_in "Twitter", with: "https://twitter.com/bcardarella"
    fill_in "Blog", with: "http://www.codecontainer.org"
    fill_in "Stackoverflow", with: "http://stackoverflow.com/null"
    check "Willing to relocate"
    click_on "Submit"
    expect(page).to have_content("Your profile has been created.")
    expect(Profile.count).to eql(previous_count + 1)
  end

end
