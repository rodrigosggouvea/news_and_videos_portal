require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:tags) }
    it { is_expected.to have_many(:comments) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:title_pt) }
    it { is_expected.to validate_presence_of(:title_es) }
    it { is_expected.to validate_presence_of(:text_pt) }
    it { is_expected.to validate_presence_of(:text_es) }
  end

  describe 'Factory' do
    it "should be valid" do
      expect(build(:news)).to be_valid
    end
  end
end
