require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:gradable) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:grade) }
  end

  context 'Factory' do
    it "Should be valid" do
      expect(build(:evaluation)).to be_valid
    end
  end
end
