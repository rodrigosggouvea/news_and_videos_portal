require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:commentable) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:locale) }
    it { is_expected.to validate_presence_of(:message) }
  end

  context 'Factory' do
    it "should be valid" do
      expect(build(:comment)).to be_valid
    end
  end
end
