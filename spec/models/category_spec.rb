require_relative '../rails_helper'

describe Category, type: :model do
  subject { create :category }

  # validations
  it {expect(subject).to validate_presence_of :title}
  it {expect(subject).to validate_uniqueness_of :title}

  # associations
  it {expect(subject).to have_many :books}

end 