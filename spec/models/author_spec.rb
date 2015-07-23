require_relative '../rails_helper'

describe Author, type: :model do
  subject { create :author }

  # validations
  it {expect(subject).to validate_presence_of :first_name}
  it {expect(subject).to validate_presence_of :last_name}

  # associations
  it {expect(subject).to have_many :books}


end 