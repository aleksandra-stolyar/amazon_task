require_relative '../rails_helper'

feature "Log in" do
  scenario "Visitor logs in successfully via login form" do
    visit new_user_session_path
    user = create(:user)

    within('#new_user') do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button('Log in')
    end
    expect(page).not_to have_content 'Log in'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'Signed in successfully.'
  end
end