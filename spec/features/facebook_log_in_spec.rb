require_relative '../rails_helper'

feature "Log in with Facebook" do
  given!(:user) { create(:user) }

  background do
    visit new_user_session_path

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = {
        :provider => 'facebook',
        :uid => '12345',
    }
  end

  scenario "Visitor logs in successfully via facebook" do
    click_link('facebook-login')

    expect(page).not_to have_content 'Log in'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'Signed in successfully.'
  end
end
