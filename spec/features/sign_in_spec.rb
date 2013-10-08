require 'spec_helper'

feature 'user signs in',%Q{
  As a registered user
  I want to sign in
  So that I can access my profile
} do

  # ACCEPTANCE CRITERIA
  # * If I  specify a valid previously registered email and password, I am authenticated and gain access to my profile
  # * If I specify invalid email and password I am not authenticated and an error message is displayed
  # * If I am already signed in, I can't sign in again

  scenario 'an existing user specifys a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content('Sign out')
  end

  scenario 'a non-existent user email and password is supplied' do
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(page).to_not have_content("Signed in successfully.")
    expect(page).to_not have_content('Sign out')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'an existing email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'
    expect(page).to have_content("Invalid email or password.")
    expect(page).to_not have_content('Sign out')
  end

  scenario 'an authenticated user cannot re-sign-in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to have_content("Sign out")
    expect(page).to_not have_content('Sign in')
  end

end
