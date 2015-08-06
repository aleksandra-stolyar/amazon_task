require_relative '../../rails_helper'

describe 'users/new.html.haml' do
  let(:user) { mock_model("User").as_new_record } #or build_stubbed(:user)

  before do
    allow(user).to receive(:email).and_return("test") #user.stub(:email).stub(:password)
    allow(user).to receive(:password).and_return("test") #user.stub(:email).stub(:password)

    assign(:user, user) #undefined method `assign' !!!!!!!!
    render
  end

  it 'renders new_user form' do
    expect(rendered).to have_selector("form",
                                      :method => "post",
                                      :action => new_user_registration_path
                                      ) do |form|
      expect(form).to have_selector("input", :type => "submit")
    end
  end
end