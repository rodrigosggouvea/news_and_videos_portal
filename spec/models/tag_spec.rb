require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:locale) }
  end

  describe 'Factory' do
    it "should be valid" do
      expect(build(:tag)).to be_valid
    end
  end
end
