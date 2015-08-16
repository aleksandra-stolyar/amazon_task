require_relative '../rails_helper'

feature "Registration" do
  scenario "Visitor registers successfully via register form" do
    visit new_user_registration_path
    within('#new_user') do
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[password]', with: '12345678'
      fill_in 'user[password_confirmation]', with: '12345678'
      click_button('Sign up')
    end
    expect(page).not_to have_content 'Sign up'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'You have signed up successfully.'
  end
end