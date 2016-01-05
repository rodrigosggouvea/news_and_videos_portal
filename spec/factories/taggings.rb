FactoryGirl.define do
  factory :tagging do
    association :taggable, factory: :news
    tag
  end

end
