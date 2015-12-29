require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:news) }
    it { is_expected.to belong_to(:tag) }
  end

  describe 'Factory' do
    it "should be valid" do
      expect(build(:tagging)).to be_valid
    end
  end
end
