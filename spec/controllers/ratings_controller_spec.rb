require_relative '../rails_helper'

RSpec.describe RatingsController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    @rating = create(:rating, user: @user)

    @rating_attributes = FactoryGirl.attributes_for(:rating, :book_id => @book)
  end

  describe "GET #new" do
    # it "assigns a new Contact to @contact"
    # it "renders the :new template"
    it "calls before_filter" do
      expect(controller).to receive(:find_book)
    end
  end
  
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "saves the new contact in the database"
  #     it "redirects to the home page"
  #   end

  #   context "with invalid attributes" do
  #     it "does not save the new contact in the database"
  #     it "re-renders the :new template"
  #   end
  # end  
end
