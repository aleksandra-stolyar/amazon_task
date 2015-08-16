require_relative '../rails_helper'

feature "Add review" do
  given(:user) { create(:user) }
  given!(:book) { create(:book) }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
    visit new_book_rating_path(book)
  end

  scenario "Logged in user adds review to book" do
    within('#new_rating') do
      fill_in 'rating[text_review]', with: Faker::Lorem.sentence
      find(:xpath, "//input[@id='stars-form']").set Faker::Number.between(1, 10)
      click_button('Add review')
    end
    # expect(page).not_to have_content 'Add review'
    expect(page).to have_content 'Your review was successfully added.'
  end

  scenario "Logged in user adds review with empty fields" do
    within('#new_rating') do
      fill_in 'rating[text_review]', with: ""
      find(:xpath, "//input[@id='stars-form']").set ""
      click_button('Add review')
    end
    expect(page).not_to have_content 'Add review'
  end

end