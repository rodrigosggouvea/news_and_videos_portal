require 'rails_helper'

RSpec.describe Video, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    xit { is_expected.to have_many_to(:taggings) }
    xit { is_expected.to have_many_to(:tags) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:title_pt) }
    it { is_expected.to validate_presence_of(:title_es) }
    it { is_expected.to validate_presence_of(:link) }
  end

  context 'Factories' do
    it "should be valid" do
      expect(build(:video)).to be_valid
    end
  end
end
