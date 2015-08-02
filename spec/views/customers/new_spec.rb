require_relative '../../rails_helper'

describe 'customers/new.html.haml' do
  let(:customer) { mock_model("Customer").as_new_record } #or build_stubbed(:customer)

  before do
    allow(customer).to receive(:email).and_return("test") #user.stub(:email).stub(:password)
    allow(customer).to receive(:password).and_return("test") #user.stub(:email).stub(:password)

    assign(:customer, customer) #undefined method `assign' !!!!!!!!
    render
  end

  it 'renders new_customer form' do
    expect(rendered).to have_selector("form",
                                      :method => "post",
                                      :action => new_customer_registration_path
                                      ) do |form|
      expect(form).to have_selector("input", :type => "submit")
    end
  end
end