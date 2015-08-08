require_relative '../rails_helper'
require "cancan/matchers"



describe Ability, type: :model do
  let(:user) { create :user }

  subject { Ability.new(user) }

  context 'dashboard' do
    it { expect(subject).to be_able_to(:access, :dashboard) }
  end
end
